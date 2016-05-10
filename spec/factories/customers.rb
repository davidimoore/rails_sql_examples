# == Schema Information
#
# Table name: customers
#
#  id         :integer          not null, primary key
#  name       :text
#  address    :text
#  city       :text
#  state      :text
#  zip        :text
#  created_at :datetime         default(Tue, 10 May 2016 13:42:38 UTC +00:00)
#  updated_at :datetime         default(Tue, 10 May 2016 13:42:38 UTC +00:00)
#

FactoryGirl.define do
  factory :customer do
    name "MyText"
    address "MyText"
    city "MyText"
    state "MyText"
    zip "MyText"
  end
end
