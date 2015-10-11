# == Schema Information
#
# Table name: interpellations
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  interpellation_date :datetime
#  content             :text(65535)
#  committee_id        :integer
#  evaluation_id       :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Interpellation < ActiveRecord::Base
  belongs_to :committee
  belongs_to :evaluation
  has_many :congressmen_interpellations
  has_many :congressmen, through: :congressmen_interpellations
  has_many :inquiries, through: :congressmen_interpellations
end
