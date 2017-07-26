# == Schema Information
#
# Table name: lefts
#
#  id          :integer          not null, primary key
#  description :text
#  created_at  :datetime         default(Sat, 24 Sep 2016 14:57:52 UTC +00:00)
#  updated_at  :datetime         default(Sat, 24 Sep 2016 14:57:52 UTC +00:00)
#

FactoryGirl.define do
  factory :left do
    description "MyText"
  end
end
