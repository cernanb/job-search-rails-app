class Comment < ActiveRecord::Base
  belongs_to :application

  def format_time
    created_at.strftime("%Y-%m-%d")
  end
end
