require 'spec_helper'

describe "Viewing report" do
	let!(:student) { Student.create(first_name:"Jane", last_name:"Doe", is_hired:true, job_title: "Teacher", start_date: Date.today, starting_salary: "50000", city:"New York", state: "CA")}
	
	it "shows error when start and end dates are not specified" do

	end

	it "shows empty report when there is no students" do
		
	end
end