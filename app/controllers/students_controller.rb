class StudentsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
     students = Student.all
     render json: students
    end

    def show
     student = find_student
     render json: student
    end

    def create
      student = Student.create!(student_params)
      render json: student, status: :created 
    end

    def update
        student = find_student
        student.update(student_params)
        render json: student
    end

    def destroy 
        student = find_student
        student.destroy
        head :no_content 
    end

    private

    def render_not_found_response
        render json: { error: "Student not found" }, status: :not_found
    end

    def student_params
        params.permit(:name, :major, :age, :instructor_id)
    end

    def find_student
        student = Student.find(params[:id])
    end
end
