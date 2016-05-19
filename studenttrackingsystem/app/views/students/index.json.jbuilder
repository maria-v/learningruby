json.array!(@students) do |student|
  json.extract! student, :id, :first_name, :last_name, :is_hired, :job_title, :start_date, :starting_salary, :city, :state
  json.url student_url(student, format: :json)
end
