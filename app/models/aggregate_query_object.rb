class AggregateQueryObject < QueryObject
  def initialize
    @connection = ActiveRecord::Base.connection
  end
end