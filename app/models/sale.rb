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
#  created_at  :datetime         default(Sat, 24 Sep 2016 14:57:52 UTC +00:00)
#  updated_at  :datetime         default(Sat, 24 Sep 2016 14:57:52 UTC +00:00)
#

class Sale < ActiveRecord::Base
end
