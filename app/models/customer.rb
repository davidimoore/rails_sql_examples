# == Schema Information
#
# Table name: customers
#
#  id         :integer          not null, primary key
#  name       :text
#  address    :text
#  city       :text
#  state      :text
#  zip        :text
#  created_at :datetime         default(Sat, 24 Sep 2016 14:57:52 UTC +00:00)
#  updated_at :datetime         default(Sat, 24 Sep 2016 14:57:52 UTC +00:00)
#

class Customer < ActiveRecord::Base
end
