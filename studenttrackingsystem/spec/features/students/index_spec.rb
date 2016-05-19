require 'spec_helper'

describe 'Viewing todo items' do
	let!(:student) { Student.create(first_name: "John", last_name: "Doe", is_hired: "yes", job_title: "QA Engineer", start_date:"2000-01-01", starting_salary: "2000", city: "San Francisco", state: "CA" )}
	it "displays no students when list is empty" do
		visit "/students"
		expect(page).to have_content("Listing Students")
		expect(page).to have_link("New Student")
	end
end