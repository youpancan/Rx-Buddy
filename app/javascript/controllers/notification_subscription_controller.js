import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="notification-subscription"
export default class extends Controller {
static values = { userId: Number}
static targets  = ["messages"]





  connect() {
    console.log("Sub okay")
  }
}
