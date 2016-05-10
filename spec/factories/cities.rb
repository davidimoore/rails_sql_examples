# == Schema Information
#
# Table name: cities
#
#  id           :integer          not null, primary key
#  name         :text
#  country_code :text
#  district     :text
#  population   :text
#  created_at   :datetime         default(Tue, 10 May 2016 13:42:38 UTC +00:00)
#  updated_at   :datetime         default(Tue, 10 May 2016 13:42:38 UTC +00:00)
#

FactoryGirl.define do
  factory :city do
    name "MyText"
    country_code "MyText"
    district "MyText"
    population "MyText"
  end
end
