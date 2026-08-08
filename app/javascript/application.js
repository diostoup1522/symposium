// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "channels"
document.addEventListener("turbo:load", () => {
  let form = document.querySelector("#formforclientvalidation");
  if (form == null) {
    return;
  }
  const regex = /^\p{L}[\p{L} .'-]*$/u;
  let input = document.querySelector("#discussion_author");
  input?.addEventListener('input', () => {
    if (regex.test(input.value)) {
      input?.setCustomValidity("");
    } else {
      input?.setCustomValidity("Invalid field.");
    }
  })
  form?.setAttribute("novalidate", true)
  form?.addEventListener('submit', (e) => {
    if (input) if (regex.test(input.value)) {
      input?.setCustomValidity("");
    } else {
      input?.setCustomValidity("Invalid field.");
    }
    if (!form.checkValidity()) {
      e.preventDefault();
    }
  })
})
