class Convention < ApplicationRecord
  belongs_to :user
  has_many :blocks, dependent: :destroy
end
