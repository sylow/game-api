# == Schema Information
#
# Table name: practices
#
#  id         :bigint           not null, primary key
#  kind       :string
#  user_id    :bigint           not null
#  uuid       :uuid
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Practice < ApplicationRecord
    belongs_to :user
    has_many :practice_deals, dependent: :delete_all
    has_many :deals, through: :practice_deals

    before_create { |p| p.uuid ||= SecureRandom.uuid }
end
