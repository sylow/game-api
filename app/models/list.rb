class List < ApplicationRecord
    belongs_to :user
    has_many :link_to_deals, as: :owner, dependent: :delete_all
    has_many :deals, through: :link_to_deals
end
