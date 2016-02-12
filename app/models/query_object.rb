class QueryObject
  def initialize(query_target)
    @query_target = query_target
    @connection = ActiveRecord::Base.connection
  end

  def select_all
   execute_query "SELECT * FROM #{table_name}"
  end

  def select_all_order_by(column_name)
   execute_query "SELECT * FROM #{table_name} order by #{column_name}"
  end

  private
  def execute_query(sql)
    @query_target.find_by_sql("#{sql}")
  end

  def table_name
    @query_target.table_name
  end





end