# == Schema Information
#
# Table name: two_player_scores
#
#  id         :integer          not null, primary key
#  player_1   :integer
#  player_2   :integer
#  created_at :datetime         default(Sat, 24 Sep 2016 14:57:52 UTC +00:00)
#  updated_at :datetime         default(Sat, 24 Sep 2016 14:57:52 UTC +00:00)
#

class TwoPlayerScore < ActiveRecord::Base
end
