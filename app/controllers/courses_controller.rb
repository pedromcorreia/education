class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

    # GET /courses
  # GET /courses.json
  def index
    school = School.find(params[:school_id])

    @courses = school.courses
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    school = School.find(params[:school_id])
    @courses = school.courses.find(params[:id])
  end

  # GET /courses/new
  def new
    school = School.find(params[:school_id])

    @course = school.courses.build
  end

  # GET /courses/1/edit
  def edit
    school = School.find(params[:school_id])
    @courses = school.courses.find(params[:id])
  end

  # POST /courses
  # POST /courses.json
  def create
    school = School.find(params[:school_id])

    @course = school.courses.create(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to [@course.school, @school], notice: 'course was successfully created.' }
        format.json { render :show, status: :created, location: [@course.school, @school] }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    school = School.find(params[:school_id])

    @course = school.courses.find(params[:id])

    respond_to do |format|
      if @course.update_attributes(course_params)
        format.html { redirect_to [@course.school, @school], notice: 'course was successfully updated.' }
        format.json { render :show, status: :ok, location: [@course.school, @school] }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    school = School.find(params[:school_id])
    @course = school.courses.find(params[:id])
    @course.destroy
    respond_to do |format|
      format.html { redirect_to school_courses_url, notice: 'course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:tittle, :description, :content, :duration, :price, :school_id)
    end
end
