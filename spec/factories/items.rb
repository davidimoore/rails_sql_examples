# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  name        :text
#  description :text
#  created_at  :datetime         default(Tue, 10 May 2016 13:42:38 UTC +00:00)
#  updated_at  :datetime         default(Tue, 10 May 2016 13:42:38 UTC +00:00)
#

FactoryGirl.define do
  factory :item do
    name "MyText"
    description "MyText"
  end
end
