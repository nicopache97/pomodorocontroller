class CreateCronos < ActiveRecord::Migration[7.0]
  def change
    create_table :cronos do |t|
      t.string :nombre
      t.date :fecha_inicio
      t.time :hora_inicio
      t.time :duracion
      t.boolean :finalizo
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
