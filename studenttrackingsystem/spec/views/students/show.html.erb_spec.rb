require 'spec_helper'

describe "students/show" do
  before(:each) do
    @student = assign(:student, stub_model(Student,
      :first_name => "MyText",
      :last_name => "Last Name",
      :is_hired => false,
      :job_title => "Job Title",
      :starting_salary => 1.5,
      :city => "MyText",
      :state => "State"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    rendered.should match(/Last Name/)
    rendered.should match(/false/)
    rendered.should match(/Job Title/)
    rendered.should match(/1.5/)
    rendered.should match(/MyText/)
    rendered.should match(/State/)
  end
end
