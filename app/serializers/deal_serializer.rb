# == Schema Information
#
# Table name: deals
#
#  id         :bigint           not null, primary key
#  dealer     :enum
#  zone       :enum
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class DealSerializer < ActiveModel::Serializer
    attributes :dealer, :zone
    has_many :hands
end
