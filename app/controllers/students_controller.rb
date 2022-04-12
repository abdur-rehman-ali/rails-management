class StudentsController < ApplicationController
    #we require id for only member actions
    before_action :set_student , only: %i[show edit update destroy]

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
            PostMailer.post_created.deliver_later
            redirect_to students_path , notice: 'Student has been created successfully'
        else
            render :new
        end
    end

    def show
    end

    def edit
    end

    def update 
        if @student.update(students_params)
            #redirect to show page of current updated student
            redirect_to student_path(@student), notice: 'Student has been updated successfully'
        else  
            #if any validation error occur then update action call
            render :update
        end
    end

    def destroy 
        @student.destroy
        redirect_to students_path, notice: 'Student has been destroyed successfully'
    end

    private 
    def students_params
        params.require(:student).permit(:name,:email,:age)
    end

    def set_student
        @student = Student.find(params[:id])
    end
end
