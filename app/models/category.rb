class Category < ApplicationRecord
  has_many :transactions
  belongs_to :user
end
