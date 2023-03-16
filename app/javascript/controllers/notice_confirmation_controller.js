import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="notice-confirmation"
export default class extends Controller {
  connect() {
    setTimeout(() => {
      this.element.remove()
    }, 3500)
  }
}
