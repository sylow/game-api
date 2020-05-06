class Practice < ApplicationRecord
    belongs_to :user

    before_create { |p| p.uuid ||= SecureRandom.uuid }
end
