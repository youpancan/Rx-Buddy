import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="notice-confirmation"
export default class extends Controller {
  connect() {
    console.log('connected')
    setTimeout(() => this.element.remove(), 2000)
  }
}
