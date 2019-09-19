class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit]
  
  def index
    @students = Student.all
  end

  def show
  end

  def edit
    if @student.active
      @student.update(active: false)
    else
      @student.update(active: true)
    end

    redirect_to @student
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end
end