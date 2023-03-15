import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"
// Connects to data-controller="user-subscription"
export default class extends Controller {
  static values = { userId: Number }
  static targets  = [ "messages","icon", 'clearButton' ]

  connect() {
    this.channel = createConsumer().subscriptions.create(
                    { channel: "UserChannel", id: this.userIdValue },
                    { received: data => {
                      this.messagesTarget.innerText = data
                      this.iconTarget.classList.remove("d-none")
                      this.clearButtonTarget.classList.remove("d-none")
                    }}

                  )
    // console.log(this.userIdValue)
  }

  disconnect() {
    console.log("Unsubscribled from the user")
    this.channel.unsubscribe()
  }

  clear() {
    this.messagesTarget.innerText = 'No new notifications'
    this.iconTarget.classList.add("d-none")
    this.clearButtonTarget.classList.add("d-none")
  }
}
