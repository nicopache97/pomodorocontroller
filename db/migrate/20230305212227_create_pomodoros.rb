class CreatePomodoros < ActiveRecord::Migration[7.0]
  def change
    create_table :pomodoros do |t|
      t.string :nombre
      t.float :tim_1

      t.timestamps
    end
  end
end
