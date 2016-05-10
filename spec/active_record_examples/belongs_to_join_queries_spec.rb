require 'rails_helper'
describe 'ActiveRecord belongs_to association queries' do

  context 'joins' do
    before(:all) do
      billable_role = create(:role, name:'Developer', billable:true)
      non_billable_role = create(:role, name:'Manager', billable:false)
      @billable_employees = ['David', 'Kaja', 'Anna'].map {|name| create(:person, name: name, role:billable_role)}
      @nonbillable_employees = ['Jack', 'Danesh'].each {|name| create(:person, name: name, role:non_billable_role)}
    end

    it 'can filter a join with a where clause' do
      expect( Person.all.joins(:role).where(roles: { billable: true} ) ).to match_array @billable_employees
    end

  end
end