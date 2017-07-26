# == Schema Information
#
# Table name: rights
#
#  id          :integer          not null, primary key
#  description :text
#  created_at  :datetime         default(Sat, 24 Sep 2016 14:57:52 UTC +00:00)
#  updated_at  :datetime         default(Sat, 24 Sep 2016 14:57:52 UTC +00:00)
#

FactoryGirl.define do
  factory :right do
    description "MyText"
  end
end
