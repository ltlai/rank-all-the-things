class List < ActiveRecord::Base
  has_many :items

  def items_to_rank
    return nil if items.empty?
    items.shuffle.each do |item|
      items.shuffle.each do |other_item|
        unless item == other_item
          return [item, other_item] if item.rank == other_item.rank
        end
      end
    end
    return nil
  end
end
