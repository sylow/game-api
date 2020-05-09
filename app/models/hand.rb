# == Schema Information
#
# Table name: hands
#
#  id      :bigint           not null, primary key
#  deal_id :bigint           not null
#  seat    :enum
#  cards   :jsonb
#  points  :integer          default(0)
#
class Hand < ApplicationRecord
    enum seat: PlayerPosition.as_hash

    #associations
    belongs_to :deal
end
