class LinkToDeal < ApplicationRecord
  belongs_to :owner, polymorphic: true
  belongs_to :deal
end
