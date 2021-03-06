# == Schema Information
#
# Table name: interpellations
#
#  id                  :integer          not null, primary key
#  name                :string
#  interpellation_date :datetime
#  content             :text
#  committee_id        :integer
#  evaluation_id       :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Interpellation < ActiveRecord::Base
  belongs_to :committee
  belongs_to :evaluation
  # has_many :congressmen, through: :congressmen_interpellations
  has_many :inquiries
  has_many :events

  has_many :course_interpellations
  has_many :courses, through: :course_interpellations

  include Classifiable

  def full_name
    "#{interpellation_date.to_date} #{name}"
  end
end
