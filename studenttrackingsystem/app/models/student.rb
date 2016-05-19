class Student < ActiveRecord::Base
	validates :first_name, presence: true
	validates :first_name, length: { minimum: 2 }
	validates :last_name, presence: true
	validates :last_name, length: { minimum: 2 }
	validates :job_title, presence: true, :if => :is_hired?
	validates :start_date, presence: true, :if => :is_hired?
	validates :starting_salary, presence: true, :if => :is_hired?
	validates :city, presence: true, :if => :is_hired?
	validates :state, presence: true, :if => :is_hired?
end
