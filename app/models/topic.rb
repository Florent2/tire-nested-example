class Topic < ActiveRecord::Base
  include Tire::Model::Search
  include Tire::Model::Callbacks

  mapping do
    indexes :name
    indexes :follower_ids, type: 'nested', as: "indexed_follower_ids", id: 'integer'
  end
  def indexed_follower_ids
    followers.pluck(:id).map { |id| {id: id} }.to_json
  end

  attr_accessible :name
  has_many :follows, dependent: :destroy
  has_many :followers, through: :follows, source: :user

  def self.search_with topic_name, follower_id
    search do
      query do
        boolean do
          must do
            match 'name', topic_name
          end
          must do
            nested path: 'follower_ids' do
              query do
                match 'follower_ids.id', follower_id
              end
            end
          end
        end
      end
    end
  end
end
