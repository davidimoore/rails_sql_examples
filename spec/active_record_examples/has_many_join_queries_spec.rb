require 'rails_helper'
describe 'ActiveRecord has_many association queries' do

  context 'joins' do

    it 'can filter a join with a where clause' do
      billable_role = create(:role, billable:true)
      non_billable_role = create(:role, name:'Manager', billable:false)
      @billable_location_1 = create(:location, name:'San Francisco', billable:true)
      @billable_location_2 = create(:location, name:'Chicago', billable:true)

      ['David', 'Kaja', 'Anna'].map {|name| create(:person, name: name, role:billable_role, location: @billable_location_1)}
      ['Devon', 'Danesh', 'Jack'].map {|name| create(:person, name: name, role:non_billable_role, location: @billable_location_2)}

      expect(Location.joins(people: :role).where(roles: { billable:true }).distinct).to match_array(@billable_location_1)

    end

  end
end