
# Utiliza la imagen base de Ubuntu 22.04 LTS (focal)
FROM ruby:3.2.2-bookworm

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Actualiza los paquetes del sistema
RUN apt-get update -y && apt-get upgrade -y

# Instala Ruby y otras dependencias necesarias para Rails
RUN apt-get install -y ruby ruby-dev zlib1g-dev libsqlite3-dev build-essential patch ruby-tzinfo ruby-dev libcurl4-openssl-dev libssl-dev make gcc g++

# Instala Node.js y Yarn para la ejecución de assets en Rails 7
#RUN apt-get install -y nodejs yarn

# Instalar Node.js y npm
#RUN apt-get install -y nodejs npm

# Instala Rails
RUN gem install rails -v '7.0.4.2'

# Instalar Node.js
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs

# Instalar Yarn
RUN curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor -o /usr/share/keyrings/yarnkey.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y yarn

# Copia los archivos de la aplicación al contenedor
COPY . .

# Instala Bundler
RUN gem install bundler

# Instala las gemas necesarias para la aplicación
RUN bundle install


# Precompila los assets de Rails
RUN rails assets:precompile

# Expone el puerto 3000 en el contenedor
EXPOSE 3000

# Define el comando para iniciar la aplicación
CMD ["rails", "server", "-b", "0.0.0.0"]

