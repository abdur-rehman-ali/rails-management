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

    def show
        @student = Student.find(params[:id])
    end

    def edit
        @student = Student.find(params[:id])
    end

    def update 
        @student = Student.find(params[:id])
        if @student.update(students_params)
            #redirect to show page of current updated student
            redirect_to student_path(@student)
        else  
            #if any validation error occur then update action call
            render :update
        end
    end

    def destroy 
        @student = Student.find(params[:id])
        @student.destroy
        redirect_to students_path
    end

    private 
    def students_params
        params.require(:student).permit(:name,:email,:age)
    end
end
