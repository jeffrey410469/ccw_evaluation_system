# == Schema Information
#
# Table name: events
#
#  id                :integer          not null, primary key
#  name              :string
#  evaluation_id     :integer
#  interpellation_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  active            :boolean          default(FALSE)
#  token             :string
#

require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
