require 'spec_helper'

describe "Adding students" do
	def add_new_student(options={})
		options[:first_name] ||= "John"
		options[:last_name] ||= "Doe" 
		options[:is_hired] ||= false
		options[:job_title] ||= ""
		# options[:start_date] ||= Date.today
		options[:start_date_year] ||= Date.today
		options[:start_date_month] ||= Date.today
		options[:start_date_day] ||= Date.today
		options[:starting_salary] ||= 0
		options[:city] ||= ""
		options[:state] ||= ""

		visit "/students"
		click_link "Add New Student"
		expect(page).to have_content("New Student")

		fill_in "First name", with: options[:first_name]
		fill_in "Last name", with: options[:last_name]

		if :is_hired
			check "Is hired"
		else
			uncheck "Is hired"
		end

		fill_in "Job title", with: options[:job_title]
		
		# select :start_date_year, :from => 'student#student_start_date_1i'
		# select :start_date_month, :from => 'student#student_start_date_2i'
		# select :start_date_day, :from => 'student#student_start_date_3i'

		fill_in "Starting salary", with: options[:starting_salary]
		fill_in "City", with: options[:city]
		fill_in "State", with: options[:state]

		click_button "Create Student"
	end

	it "redirects to the 'add new student' page on success " do
		visit "/students"
		click_link "Add New Student"
		expect(page).to have_content("New Student")
		expect(page).to have_button("Create Student")
		expect(page).to have_link("Back")
	end

	it "displays an error when student has no first name" do
		add_new_student first_name: "", last_name: "Last Name"
		expect(page).to have_content("error")
		expect(Student.count).to eq(0)
	end

	it "displays an error when student has no last name" do
		add_new_student first_name: "First Name", last_name: ""
		expect(page).to have_content("error")
		expect(Student.count).to eq(0)
	end

	it "displays an error when first name is less than 2 characters" do
		add_new_student first_name: "M", last_name: "Last Name"
		expect(page).to have_content("error")
		expect(Student.count).to eq(0)
	end

	it "displays an error when first name is less than 2 characters" do
		add_new_student first_name: "M"
		expect(page).to have_content("error")
		expect(Student.count).to eq(0)
	end

	it "displays an error when last name is less than 2 characters" do
		add_new_student first_name: "First Name", last_name: "S"
		expect(page).to have_content("error")
		expect(Student.count).to eq(0)
	end

	it "displays an error when student is listed as hired but does not have job title" do
		add_new_student first_name: "Tester", last_name: "Testing", is_hired: true, starting_date: Date.today, starting_salary: "20", city: "New York", state: "CA"
		expect(page).to have_content("error")
		expect(Student.count).to eq(0)
	end

	it "displays an error when student is listed as hired but does not have start date" do
		add_new_student first_name: "Tester", last_name: "Testing", is_hired: true, starting_salary: "20", city: "New York", state: "CA"
		expect(page).to have_content("error")
		expect(Student.count).to eq(0)
	end

	it "displays an error when student is listed as hired but does not have starting salary" do
		add_new_student first_name: "Tester", last_name: "Testing", is_hired: true, starting_date: Date.today, city: "New York", state: "CA"
		expect(page).to have_content("error")
		expect(Student.count).to eq(0)
	end

	it "displays an error when student is listed as hired but does not have city" do
		add_new_student first_name: "Tester", last_name: "Testing", is_hired: true, starting_salary: "20", starting_date: Date.today, state: "CA"
		expect(page).to have_content("error")
		expect(Student.count).to eq(0)
	end

	it "displays an error when student is listed as hired but does not have state" do
		add_new_student first_name: "Tester", last_name: "Testing", is_hired: true, starting_salary: "20", starting_date: Date.today, city: "New York"
		expect(page).to have_content("error")
		expect(Student.count).to eq(0)
	end

	it "can add 1000 students" do
		for i in 0..1000
			add_new_student
			click_link "Back"
		end
		expect(Student.count).to eq(1000)
	end
end 
