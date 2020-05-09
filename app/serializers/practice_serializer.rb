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
class PracticeSerializer < ActiveModel::Serializer
    attributes :kind
    has_many :deals
end
