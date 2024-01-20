class CreateGames < ActiveRecord::Migration[7.1]
  def change
    create_table :games do |t|
      t.date :date
      t.boolean :is_nine_holes

      t.timestamps
    end
  end
end
