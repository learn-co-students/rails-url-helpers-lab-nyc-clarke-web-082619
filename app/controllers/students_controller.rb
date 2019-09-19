class StudentsController < ApplicationController
  before_action :set_student, only:[:show, :edit]
  
  def index
    @students = Student.all
  end

  def show
  end

  def edit
    if @student.active == false
      @student.update(active: true)
    else
      @student.update(active: false)
    end
    redirect_to "/students/#{@student.id}"
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end
end