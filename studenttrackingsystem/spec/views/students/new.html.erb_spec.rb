require 'spec_helper'

describe "students/new" do
  before(:each) do
    assign(:student, stub_model(Student,
      :first_name => "MyText",
      :last_name => "MyString",
      :is_hired => false,
      :job_title => "MyString",
      :starting_salary => 1.5,
      :city => "MyText",
      :state => "MyString"
    ).as_new_record)
  end

  it "renders new student form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", students_path, "post" do
      assert_select "textarea#student_first_name[name=?]", "student[first_name]"
      assert_select "input#student_last_name[name=?]", "student[last_name]"
      assert_select "input#student_is_hired[name=?]", "student[is_hired]"
      assert_select "input#student_job_title[name=?]", "student[job_title]"
      assert_select "input#student_starting_salary[name=?]", "student[starting_salary]"
      assert_select "textarea#student_city[name=?]", "student[city]"
      assert_select "input#student_state[name=?]", "student[state]"
    end
  end
end
