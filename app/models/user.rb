# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  name                   :string
#  identity               :string
#  birthdate              :date
#  district_id            :integer
#  role                   :integer
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  course_id              :integer
#  gender                 :integer
#  education              :integer
#  student_number         :string
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :course

  has_many :teached_courses, class_name: "Course", foreign_key: :teacher_id

  has_many :surveys
  has_many :inquiries, through: :surveys
  has_many :rated_congressmen, through: :inquiries, source: :congressman

  has_and_belongs_to_many :events
  belongs_to :district
  enum role: [:student, :citizen, :volunteer, :regular, :teacher]
  enum gender: ["male", "female", "third_gender"]
  enum education: ["elementary_school", "junior_high_school", "senior_high_school", "college", "graduate_school", "others"]
  attr_reader :city
  attr_accessor :token
  validates_presence_of :name, :identity, :birthdate, :district_id, :role
  validates :identity, taiwanese_id: true


  scope :wandering_students, -> { student.where(course_id: nil) }

  def city_district
    "#{district.city.name} - #{district.name}"
  end
end
