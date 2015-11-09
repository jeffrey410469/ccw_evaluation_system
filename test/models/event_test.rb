# == Schema Information
#
# Table name: events
#
#  id                :integer          not null, primary key
#  name              :string(255)
#  evaluation_id     :integer
#  interpellation_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  active            :boolean          default(FALSE)
#
# Indexes
#
#  index_events_on_evaluation_id      (evaluation_id)
#  index_events_on_interpellation_id  (interpellation_id)
#

require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
