class StudentsController < ApplicationController
    def index 
        @students = Student.all
    end

    def new
        puts "new called"
        @student = Student.new 
    end

    def create 
        @student = Student.new(students_params) 
        if  @student.save
            redirect_to students_path
        else
            render :new
        end
    end

    private 
    def students_params
        params.require(:student).permit(:name,:email,:age)
    end
end
