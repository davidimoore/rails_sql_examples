# == Schema Information
#
# Table name: country_languages
#
#  id           :integer          not null, primary key
#  country_code :text
#  language     :text
#  is_official  :integer
#  percentage   :float
#  created_at   :datetime         default(Tue, 10 May 2016 13:42:38 UTC +00:00)
#  updated_at   :datetime         default(Tue, 10 May 2016 13:42:38 UTC +00:00)
#

class CountryLanguage < ActiveRecord::Base
end
