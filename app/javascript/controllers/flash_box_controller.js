import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    if (this.element.children.length === 1) {
      this.element.style.display = 'none';
    }
  }
  close() {
    this.element.style.display = 'none';
  }
}
