// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";
import "../stylesheets/application";
Rails.start();
Turbolinks.start();
ActiveStorage.start();

require("trix");
require("@rails/actiontext");

// elementleri sürükle bırak yapabilmek için kütüphane
import Sortable from "sortablejs";
// element düzenlemek için üzerine tıklamalısın.
document.addEventListener("turbolinks:load", () => {
  document.addEventListener("click", () => {
    let element = event.target.closest(".p-content");
    if (!element) return;

    element.classList.add("d-none");
    element.nextElementSibling.classList.remove("d-none");
    event.preventDefault();
  });

  document.addEventListener("click", () => {
    if (!event.target.matches(".cancel")) return;

    let element = event.target.closest("p-form");

    element.classList.add("d-none");
    element.previousElementSibling.classList.remove("d-none");
    event.preventDefault();
  });
  // (https://github.com/SortableJS/Sortable)
  let element = document.getElementById("elements");
  Sortable.create(elements, { animation: 150, delay: 100 }); // mobil için delay eklendi
});
