# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  body       :string
#  created_at :datetime         default(Sat, 24 Sep 2016 14:57:52 UTC +00:00)
#  updated_at :datetime         default(Sat, 24 Sep 2016 14:57:52 UTC +00:00)
#

FactoryGirl.define do
  factory :post do
    body "MyString"
  end
end
