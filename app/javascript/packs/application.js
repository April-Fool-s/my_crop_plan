// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application";

Rails.start()
Turbolinks.start()
ActiveStorage.start()

document.addEventListener('turbolinks:load', () => {
  document.querySelectorAll('.menu-trigger').forEach(trigger => {
    trigger.addEventListener('click', function(event) {
      event.preventDefault();

      this.classList.toggle('active');
      const menu = document.getElementById('sp-menu');

      if (menu.style.display === 'none' || menu.style.display === '') {
        menu.style.display = 'block';
        menu.style.opacity = 0;
        let opacity = 0;
        const fadeIn = setInterval(() => {
          opacity += 0.1;
          menu.style.opacity = opacity;
          if (opacity >= 1) clearInterval(fadeIn);
        }, 30);
      } else {
        let opacity = 1;
        const fadeOut = setInterval(() => {
          opacity -= 0.1;
          menu.style.opacity = opacity;
          if (opacity <= 0) {
            clearInterval(fadeOut);
            menu.style.display = 'none';
          }
        }, 30);
      }
    });
  });
});
