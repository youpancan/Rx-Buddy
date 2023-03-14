import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="user-subscription"
export default class extends Controller {
  static values = { userId: Number }
  static targets  = [ "messages" ]

  connect() {
    console.log(this.userIdValue)
  }
}
