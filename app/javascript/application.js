// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

//import "jquery"
import "popper"
import "bootstrap"

const popover = new bootstrap.Popover('.example-popover', {
  container: 'body'
})
