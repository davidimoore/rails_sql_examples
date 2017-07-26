# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  name        :text
#  description :text
#  created_at  :datetime         default(Sat, 24 Sep 2016 14:57:52 UTC +00:00)
#  updated_at  :datetime         default(Sat, 24 Sep 2016 14:57:52 UTC +00:00)
#

FactoryGirl.define do
  factory :item do
    name "MyText"
    description "MyText"
  end
end
