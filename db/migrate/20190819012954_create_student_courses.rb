class CreateStudentCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :student_courses do |t|
      t.bool :active
      t.references :course, foreign_key: true
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
