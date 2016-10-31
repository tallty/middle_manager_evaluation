# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
begin
	User.delete_all
	User.create!([
		{
			id: 1, job_num: 'leader_job_num', password: 'hahaha', password_confirmation: 'hahaha', user_type: 'leader', take_part_in: true
		},
		{
			id: 2, job_num: 'staff_job_num', password: 'hahaha', password_confirmation: 'hahaha', user_type: 'staff', take_part_in: true
		}
		])
	
	MiddleManager.create!([
		{
			id: 3, job_num: 'm1_job_num', password: 'hahaha', password_confirmation: 'hahaha', user_type: 'middle_manager', take_part_in: true
		},
		{
			id: 4, job_num: 'm2_job_num', password: 'hahaha', password_confirmation: 'hahaha', user_type: 'middle_manager', take_part_in: true
		}
		])

	Admin.delete_all
	Admin.create!(
		{
			id: 1, email: "hahaha@qq.com", password: 'hahaha', password_confirmation: 'hahaha'
		})

	Activity.delete_all
	Activity.create!(
		{
			id: 2, first_phase_begin: "2016-10-1 00:00:00", second_phase_begin: "2016-11-1 00:00:00", third_phase_begin: "2016-12-1 00:00:00"
		})

end
