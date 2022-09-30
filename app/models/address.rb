class Address < ApplicationRecord
  belongs_to :user

  validates :house_no, presence: true
  validates :area, presence: true
end
