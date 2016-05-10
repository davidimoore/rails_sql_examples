# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  post_id    :integer
#  body       :string
#  created_at :datetime         default(Tue, 10 May 2016 13:42:38 UTC +00:00)
#  updated_at :datetime         default(Tue, 10 May 2016 13:42:38 UTC +00:00)
#

FactoryGirl.define do
  factory :comment do
    post_id 1
    body "MyString"
  end
end
