require 'spec_helper'

describe "students/index" do
  before(:each) do
    assign(:students, [
      stub_model(Student,
        :first_name => "MyText",
        :last_name => "Last Name",
        :is_hired => false,
        :job_title => "Job Title",
        :starting_salary => 1.5,
        :city => "MyText",
        :state => "State"
      ),
      stub_model(Student,
        :first_name => "MyText",
        :last_name => "Last Name",
        :is_hired => false,
        :job_title => "Job Title",
        :starting_salary => 1.5,
        :city => "MyText",
        :state => "State"
      )
    ])
  end

  it "renders a list of students" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Job Title".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
  end
end
