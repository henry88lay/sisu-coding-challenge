class Page < ApplicationRecord
  def average_rating
    self.class.average(:vote)
  end
end
