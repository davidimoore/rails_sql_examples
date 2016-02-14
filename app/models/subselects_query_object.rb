class SubselectsQueryObject < QueryObject
  def initialize
    @connection = ActiveRecord::Base.connection
  end
end