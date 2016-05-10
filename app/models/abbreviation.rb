# == Schema Information
#
# Table name: abbreviations
#
#  id         :integer          not null, primary key
#  first      :text
#  second     :text
#  created_at :datetime         default(Tue, 10 May 2016 13:42:38 UTC +00:00)
#  updated_at :datetime         default(Tue, 10 May 2016 13:42:38 UTC +00:00)
#

class Abbreviation < ActiveRecord::Base
end
