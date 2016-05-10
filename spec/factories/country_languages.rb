# == Schema Information
#
# Table name: country_languages
#
#  id           :integer          not null, primary key
#  country_code :text
#  language     :text
#  is_official  :integer
#  percentage   :float
#  created_at   :datetime         default(Tue, 10 May 2016 13:42:38 UTC +00:00)
#  updated_at   :datetime         default(Tue, 10 May 2016 13:42:38 UTC +00:00)
#

FactoryGirl.define do
  factory :country_language do
    country_code "MyText"
    is_official 1
    percentage 1.5
  end
end
