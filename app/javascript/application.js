// // Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
// import "@hotwired/turbo-rails"
// import "controllers"
// // import "@popperjs/core"
// import "bootstrap"
// import "popper"



import "@hotwired/turbo-rails"
import "controllers"
import * as bootstrap from "bootstrap"

import "./utilities/sorting"
import "./utilities/check_password"

import "./utilities/form_inline"


// document.addEventListener("turbo:load", () => {
//   new bootstrap.Tooltip(document.body, {
//     selector: "[data-bs-toggle='tooltip']"
//   })
// })


// import "@hotwired/turbo-rails"
// import "controllers"
// import * as bootstrap from "bootstrap"



// // Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
// import "@popperjs/core"
// import "bootstrap"

// // Инициализация компонентов Bootstrap
// document.addEventListener("DOMContentLoaded", () => {
//   '[data-bs-toggle="tooltip"]'.forEach(el => new bootstrap.Tooltip(el))
// })