class StudentCoursesController < ApplicationController
  before_action :set_student_course, only: [:show, :edit, :update, :destroy]

  # GET /student_courses
  # GET /student_courses.json
  def index
    school = School.find(params[:school_id])
    @student_courses = school.student_courses
  end

  # GET /student_courses/1
  # GET /student_courses/1.json
  def show
    school = School.find(params[:school_id])
    @student_courses = school.student_courses.find(params[:id])
  end

  # GET /student_courses/new
  def new
    school = School.find(params[:school_id])

    @student_course = school.student_courses.build
  end

  # GET /student_courses/1/edit
  def edit
    school = School.find(params[:school_id])
    @student_courses = school.student_courses.find(params[:id])
  end

  # POST /student_courses
  # POST /student_courses.json
  def create
    school = School.find(params[:school_id])

    @student_course = school.student_courses.create(student_course_params)

    respond_to do |format|
      if @student_course.save
        format.html { redirect_to [@student_course.school, @school], notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: [@student_course.school, @school] }
      else
        format.html { render :new }
        format.json { render json: @student_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_courses/1
  # PATCH/PUT /student_courses/1.json
  def update
    school = School.find(params[:school_id])

    @student_course = school.student_courses.find(params[:id])

    respond_to do |format|
      if @student_course.update_attributes(student_course_params)
        format.html { redirect_to [@student_course.school, @school], notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: [@student_course.school, @school] }
      else
        format.html { render :edit }
        format.json { render json: @student_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_courses/1
  # DELETE /student_courses/1.json
  def destroy
    school = School.find(params[:school_id])
    @student_course = school.student_courses.find(params[:id])
    @student_course.destroy
    respond_to do |format|
      format.html { redirect_to school_student_courses_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

   private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_course
      @student_course = StudentCourse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_course_params
      params.require(:student_course).permit(:active, :course_id, :student_id)
    end
end
