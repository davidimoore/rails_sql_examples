# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  body       :string
#  created_at :datetime         default(Tue, 10 May 2016 13:42:38 UTC +00:00)
#  updated_at :datetime         default(Tue, 10 May 2016 13:42:38 UTC +00:00)
#

class PostSerializer < ActiveModel::Serializer
  attributes :id, :body
end
