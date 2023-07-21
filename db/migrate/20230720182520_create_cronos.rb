class CreateCronos < ActiveRecord::Migration[7.0]
  def change
    create_table :cronos do |t|
      t.string  :nombre
      t.date    :fecha_inicio
      t.integer :user_id
      t.time    :hora_inicio
      t.time    :duracion
      t.boolean :finalizo

      t.timestamps
    end
  end
end
