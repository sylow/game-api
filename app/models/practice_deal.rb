# == Schema Information
#
# Table name: practice_deals
#
#  id          :bigint           not null, primary key
#  practice_id :bigint           not null
#  deal_id     :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class PracticeDeal < ApplicationRecord
  belongs_to :practice
  belongs_to :deal
end
