class List < ActiveRecord::Base
  has_many :items

  def items_to_rank
    return nil if items.empty?
    items.shuffle.each do |item|
      items.shuffle.each do |other_item|
        unless item == other_item
          return [item, other_item] if item.votes == other_item.votes
        end
      end
    end
    nil
  end
end
