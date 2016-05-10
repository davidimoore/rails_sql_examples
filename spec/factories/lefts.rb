# == Schema Information
#
# Table name: lefts
#
#  id          :integer          not null, primary key
#  description :text
#  created_at  :datetime         default(Tue, 10 May 2016 13:42:38 UTC +00:00)
#  updated_at  :datetime         default(Tue, 10 May 2016 13:42:38 UTC +00:00)
#

FactoryGirl.define do
  factory :left do
    description "MyText"
  end
end
