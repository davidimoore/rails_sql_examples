class JoinQueryObject < QueryObject
  def initialize
    @connection = ActiveRecord::Base.connection
  end
end