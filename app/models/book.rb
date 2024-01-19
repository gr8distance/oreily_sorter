class Book < ApplicationRecord
  def to_url
    to_oreily.to_url
  end

  private

  def to_oreily
    Oreily::Book.new(self)
  end
end
