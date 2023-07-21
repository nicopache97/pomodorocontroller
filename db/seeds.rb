# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Crear usuarios de ejemplo
User.create(nombre: 'John Doe', email: 'john@example.com', password: 'password')
User.create(nombre: 'Jane Smith', email: 'jane@example.com', password: 'password')

# Crear cronos de ejemplo relacionados con los usuarios creados anteriormente
Crono.create(nombre: 'Tarea de Diseño', fecha_inicio: Date.today, hora_inicio: Time.now, duracion: Time.parse('00:30:00'), finalizo: false, user_id: 1)
Crono.create(nombre: 'Investigación de Mercado', fecha_inicio: Date.today, hora_inicio: Time.now, duracion: Time.parse('01:15:00'), finalizo: false, user_id: 1)
Crono.create(nombre: 'Reunión de Equipo', fecha_inicio: Date.today, hora_inicio: Time.now, duracion: Time.parse('01:00:00'), finalizo: true, user_id: 2)
Crono.create(nombre: 'Desarrollo de Prototipo', fecha_inicio: Date.today, hora_inicio: Time.now, duracion: Time.parse('02:00:00'), finalizo: false, user_id: 2)
Crono.create(nombre: 'Sprint de Programación', fecha_inicio: Date.today - 2.days, hora_inicio: Time.parse('10:00:00'), duracion: Time.parse('04:30:00'), finalizo: true, user_id: 3)
Crono.create(nombre: 'Presentación de Proyecto', fecha_inicio: Date.today - 1.day, hora_inicio: Time.parse('14:00:00'), duracion: Time.parse('03:45:00'), finalizo: false, user_id: 4)
Crono.create(nombre: 'Entrevista con Cliente', fecha_inicio: Date.today - 3.days, hora_inicio: Time.parse('09:30:00'), duracion: Time.parse('01:45:00'), finalizo: false, user_id: 5)

# Crear más usuarios y cronos de ejemplo
10.times do |n|
  user = User.create(nombre: "Usuario #{n + 3}", email: "usuario#{n + 3}@example.com", password: 'password')
  4.times do |m|
    duracion_hours = rand(0..3)
    duracion_minutes = rand(0..59)
    duracion_seconds = rand(0..59)
    duracion = Time.parse("#{duracion_hours}:#{duracion_minutes}:#{duracion_seconds}")
    Crono.create(nombre: "Crono #{m + 1} de #{user.nombre}", fecha_inicio: Date.today - m.days, hora_inicio: Time.now, duracion: duracion, finalizo: [true, false].sample, user_id: user.id)
  end
end

