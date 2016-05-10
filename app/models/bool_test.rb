# == Schema Information
#
# Table name: bool_tests
#
#  id         :integer          not null, primary key
#  a          :integer
#  b          :integer
#  created_at :datetime         default(Tue, 10 May 2016 13:42:38 UTC +00:00)
#  updated_at :datetime         default(Tue, 10 May 2016 13:42:38 UTC +00:00)
#

class BoolTest < ActiveRecord::Base
end
