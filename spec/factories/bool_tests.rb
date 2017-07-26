# == Schema Information
#
# Table name: bool_tests
#
#  id         :integer          not null, primary key
#  a          :integer
#  b          :integer
#  created_at :datetime         default(Sat, 24 Sep 2016 14:57:52 UTC +00:00)
#  updated_at :datetime         default(Sat, 24 Sep 2016 14:57:52 UTC +00:00)
#

FactoryGirl.define do
  factory :bool_test do
    a 1
    b 1
  end
end
