class List < ActiveRecord::Base
  has_many :items

  # contents needs to be a string where items are delineated by newlines (\n)
  def populate!(contents)
    contents.split("\n").each do |item_name|
      items.create!(name: item_name)
    end
  end

  def items_to_rank
    return nil if items.empty?
    items.shuffle.combination(2).to_a.each do |pair|
      return pair if pair[0].votes == pair[1].votes
    end
    nil
  end
end
