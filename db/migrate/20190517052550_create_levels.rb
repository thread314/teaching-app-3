class CreateLevels < ActiveRecord::Migration[5.1]
  def change
    create_table :levels do |t|
      t.text :question

      t.timestamps
    end
  end
end
