class List < ActiveRecord::Base
  has_many :items

  validates_presence_of :name

  def items_to_rank
    return nil if items.empty?
    items.shuffle.combination(2).to_a.each do |pair|
      return pair if pair[0].votes == pair[1].votes
    end
    nil
  end
end
