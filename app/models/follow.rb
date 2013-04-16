class Follow < ActiveRecord::Base
  attr_accessible :topic, :user
  belongs_to :topic
  belongs_to :user

  def after_save
    topic.tire.update_index
  end
end
