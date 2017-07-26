# == Schema Information
#
# Table name: tracks
#
#  id           :integer          not null, primary key
#  album_id     :integer
#  title        :text
#  track_number :integer
#  duration     :integer
#  created_at   :datetime         default(Sat, 24 Sep 2016 14:57:52 UTC +00:00)
#  updated_at   :datetime         default(Sat, 24 Sep 2016 14:57:52 UTC +00:00)
#

class Track < ActiveRecord::Base
end
