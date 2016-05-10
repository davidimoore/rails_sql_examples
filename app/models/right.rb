# == Schema Information
#
# Table name: rights
#
#  id          :integer          not null, primary key
#  description :text
#  created_at  :datetime         default(Tue, 10 May 2016 13:42:38 UTC +00:00)
#  updated_at  :datetime         default(Tue, 10 May 2016 13:42:38 UTC +00:00)
#

class Right < ActiveRecord::Base
end
