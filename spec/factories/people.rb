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

FactoryGirl.define do
  factory :person do
    name "MyString"
    role_id 1
    location_id 1
  end
end
