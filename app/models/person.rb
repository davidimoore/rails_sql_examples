# == Schema Information
#
# Table name: people
#
#  id          :integer          not null, primary key
#  name        :string
#  role_id     :integer
#  location_id :integer
#  manager_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Person < ActiveRecord::Base
  belongs_to :manager, class_name: "Person", foreign_key: :manager_id
  has_many   :employees, class_name: "Person", foreign_key: :manager_id
  belongs_to :role
  belongs_to :location
end
