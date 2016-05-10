class QueryObject
  attr_accessor :connection

  def initialize(query_target)
    @query_target = query_target
    @connection = ActiveRecord::Base.connection
  end

  def ar_query(sql)
    @query_target.find_by_sql("#{sql}")
  end

  def sql_query(sql)
    @connection.execute(sql).values.flatten
  end

  def execute(query)
    @connection.execute(query).values
  end

  private
  def table_name
    @query_target.table_name
  end


end