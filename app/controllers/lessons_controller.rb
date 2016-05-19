class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_enrollment_for_current_lesson

  def show
  end

  private

  def require_enrollment_for_current_lesson
    if current_user.enrolled_in?(current_lesson.section.course) == false
      redirect_to course_path(current_lesson.section.course), alert: 'Please Enroll to See This Lesson'
    end
  end

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end

end
