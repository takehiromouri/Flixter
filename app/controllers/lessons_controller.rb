class LessonsController < ApplicationController
	before_action :authenticate_user!
	before_action :authenticate_enrollment_for_current_user

	def show
	end

	private


	def authenticate_enrollment_for_current_user
		if current_user.enrolled_in?(current_lesson.section.course) == false
			redirect_to course_path, :alert => 'Enroll in this course to view lessons'
		end
	end

	helper_method :current_lesson
  	def current_lesson
    	@current_lesson ||= Lesson.find(params[:id])
  	end
end
