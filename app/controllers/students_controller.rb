class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :activate]
  
  def index
    @students = Student.all
  end

  def show
  end

  def edit
    render :edit
  end

  def activate
    @student.active = !@student.active
    @student.save
    redirect_to student_path(@student)
  end

  def update
    @student.update(student_params)
    redirect_to student_path(@student)
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end

    def student_params
      params.require(:student).permit(:first_name, :last_name, :active)
    end

end