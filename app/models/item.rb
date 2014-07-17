class Item < ActiveRecord::Base
  belongs_to :list

  def upvote
    self.votes += 1
    save!
  end
end
