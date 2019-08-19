class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.tittle :
      t.description :
      t.content :
      t.duration :
      t.price :
      t.references :school, foreign_key: true

      t.timestamps
    end
  end
end
