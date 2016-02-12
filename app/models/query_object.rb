class QueryObject
  def initialize
    @connection = ActiveRecord::Base.connection
  end

  def select_all_statement(obj)
      sql(obj, "SELECT * FROM #{obj.table_name}")
  end


  def sql(object, query)
    object.find_by_sql(query)
  end









end