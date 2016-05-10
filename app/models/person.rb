# == Schema Information
#
# Table name: people
#
#  id          :integer          not null, primary key
#  name        :string
#  role_id     :integer
#  location_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Person < ActiveRecord::Base
  belongs_to :role
  belongs_to :location
end
