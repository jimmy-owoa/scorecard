class CreateHoles < ActiveRecord::Migration[7.1]
  def change
    create_table :holes do |t|
      t.integer :hole_number
      t.integer :par
      t.integer :handicap
      t.integer :yardage

      t.timestamps
    end
  end
end
