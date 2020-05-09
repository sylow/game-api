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
class Deal < ApplicationRecord
    enum dealer: PlayerPosition.as_hash
    enum zone: DealZone.as_hash, _prefix: :zone
  
    #validations
    validates :dealer, presence: true
    validates :zone, presence: true
  
    #associations
    has_many :games, dependent: :destroy
    has_many :hands, -> {order(:id)}, dependent: :destroy    
end
