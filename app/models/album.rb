# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  title      :text
#  artist     :text
#  label      :text
#  released   :text
#  created_at :datetime         default(Tue, 10 May 2016 13:42:38 UTC +00:00)
#  updated_at :datetime         default(Tue, 10 May 2016 13:42:38 UTC +00:00)
#

class Album < ActiveRecord::Base
end
