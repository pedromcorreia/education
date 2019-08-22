require 'test_helper'

class StudentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student = students(:one)
  end

  test "should get index" do
    @student.inspect
    get school_students_url
    assert_response :success
  end

  test "should get new" do
    get new_school_student_url
    assert_response :success
  end

  test "should create student" do
    assert_difference('Student.count') do
      post school_students_url, params: { student: { name: @student.name, school_id: @student.school_id } }
    end

    assert_redirected_to school_student_url(Student.last)
  end

  test "should show student" do
    get school_student_url(@student)
    assert_response :success
  end

  test "should get edit" do
    get edit_school_student_url(@student)
    assert_response :success
  end

  test "should update student" do
    patch school_student_url(@student), params: { student: { name: @student.name, school_id: @student.school_id } }
    assert_redirected_to school_student_url(@student)
  end

  test "should destroy student" do
    assert_difference('Student.count', -1) do
      delete school_student_url(@student)
    end

    assert_redirected_to school_students_url
  end
end
