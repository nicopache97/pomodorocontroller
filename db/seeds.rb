# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Crear usuarios de ejemplo
User.create(nombre: 'John Doe', email: 'john@example.com', password: 'password')
User.create(nombre: 'Jane Smith', email: 'jane@example.com', password: 'password')

# Crear cronos de ejemplo relacionados con los usuarios creados anteriormente
Crono.create(nombre: 'Tarea de Diseño', fecha_inicio: Date.today, hora_inicio: Time.now, user_id: 1, duracion: 30, finalizo: false)
Crono.create(nombre: 'Investigación de Mercado', fecha_inicio: Date.today, hora_inicio: Time.now, user_id: 1, duracion: 45, finalizo: false)
Crono.create(nombre: 'Reunión de Equipo', fecha_inicio: Date.today, hora_inicio: Time.now, user_id: 2, duracion: 60, finalizo: true)
Crono.create(nombre: 'Desarrollo de Prototipo', fecha_inicio: Date.today, hora_inicio: Time.now, user_id: 2, duracion: 120, finalizo: false)

# Crear más usuarios y cronos de ejemplo
10.times do |n|
  user = User.create(nombre: "Usuario #{n + 3}", email: "usuario#{n + 3}@example.com", password: 'password')
  3.times do |m|
    hora = Time.now - (rand(1..24)).hours
    Crono.create(nombre: "Crono #{m + 1} de #{user.nombre}", fecha_inicio: Date.today - m.days, hora_inicio: hora, user_id: user.id, duracion: rand(30..120), finalizo: [true, false].sample)
  end
end

