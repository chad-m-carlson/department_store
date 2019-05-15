class Item < ApplicationRecord
  belongs_to :department
  has_man :comments
end
