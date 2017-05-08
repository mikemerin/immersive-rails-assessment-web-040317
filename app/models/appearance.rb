class Appearance < ApplicationRecord

  belongs_to :guest
  belongs_to :episode

  validates :rating, inclusion: { in: 1..5, message: "must be between 1 and 5" }

end
