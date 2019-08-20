class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  # GET /students
  # GET /students.json
  def index
    school = School.find(params[:school_id])

    @students = school.students
  end

  # GET /students/1
  # GET /students/1.json
  def show
    school = School.find(params[:school_id])
    @students = school.students.find(params[:id])
  end

  # GET /students/new
  def new
    school = School.find(params[:school_id])

    @student = school.students.build
  end

  # GET /students/1/edit
  def edit
    school = School.find(params[:school_id])
    @students = school.students.find(params[:id])
  end

  # POST /students
  # POST /students.json
  def create
    school = School.find(params[:school_id])

    @student = school.students.create(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to [@student.school, @school], notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: [@student.school, @school] }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    school = School.find(params[:school_id])

    @student = school.students.find(params[:id])

    respond_to do |format|
      if @student.update_attributes(student_params)
        format.html { redirect_to [@student.school, @school], notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: [@student.school, @school] }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    school = School.find(params[:school_id])
    @student = school.students.find(params[:id])
    @student.destroy
    respond_to do |format|
      format.html { redirect_to school_students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:name, :school_id)
    end
end
