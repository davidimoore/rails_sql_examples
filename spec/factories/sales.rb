# == Schema Information
#
# Table name: sales
#
#  id          :integer          not null, primary key
#  item_id     :integer
#  customer_id :integer
#  date        :date
#  quantity    :integer
#  price       :integer
#  created_at  :datetime         default(Tue, 10 May 2016 13:42:38 UTC +00:00)
#  updated_at  :datetime         default(Tue, 10 May 2016 13:42:38 UTC +00:00)
#

FactoryGirl.define do
  factory :sale do
    item_id 1
    customer_id 1
    date "2016-02-11"
    quantity 1
    price 1
  end
end
