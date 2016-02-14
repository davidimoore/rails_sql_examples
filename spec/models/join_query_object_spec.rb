require 'rails_helper'
describe JoinQueryObject do
  context '#ar_query' do
    it 'sends the find_by_sql method to its query_target' do
      query_target = double('query_target')
      sql = 'FIND STUFF'
      allow(query_target).to receive(:find_by_sql).with(sql)
      JoinQueryObject.new(query_target).ar_query(sql)
      expect(query_target)
          .to have_received(:find_by_sql).with(sql)
    end
  end

end