require 'rails_helper'

describe "Queries with custom joins" do
  let(:location_1)  { FactoryGirl.create(:location, name: "SF")}
  let(:location_2)  { FactoryGirl.create(:location, name: "Boston")}
  let(:location_3)  { FactoryGirl.create(:location, name: "Austin")}

  let(:employee_role) { FactoryGirl.create(:role, name:'employee') }
  let(:manager_role)  { FactoryGirl.create(:role, name:'manager')}

  let!(:eve)  {    FactoryGirl.create(:person,  name:"eve",       role_id: manager_role.id,  location:location_2, manager_id: nil) }
  let!(:bill) {    FactoryGirl.create(:person,  name: "bill",     role_id: manager_role.id,  location:location_2, manager_id: nil) }
  let!(:wendell) { FactoryGirl.create(:person,  name: "wendell",  role_id: employee_role.id, location:location_2, manager_id: eve.id) }
  let!(:christie) { FactoryGirl.create(:person, name: "christie", role_id: employee_role.id, location:location_2, manager_id: eve.id) }
  let!(:sandy )   { FactoryGirl.create(:person, name: "sandy",    role_id: employee_role.id, location:location_3, manager_id: bill.id) }



  it "returns people not managed by Eve" do


    people =
    Person.
      joins(<<-SQL).
      LEFT JOIN people managers
      ON managers.id = people.manager_id
      SQL
      where.
      not(managers: { id: Person.find_by!(name: "eve") })

  end
end