# == Schema Information
#
# Table name: abbreviations
#
#  id         :integer          not null, primary key
#  first      :text
#  second     :text
#  created_at :datetime         default(Sat, 24 Sep 2016 14:57:52 UTC +00:00)
#  updated_at :datetime         default(Sat, 24 Sep 2016 14:57:52 UTC +00:00)
#

class Abbreviation < ActiveRecord::Base
end
