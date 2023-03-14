import { Controller } from "@hotwired/stimulus"

import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { chatbotId: Number }
  static targets = ["messages"]

  connect() {
    console.log(`Subscribe to the chatbot with the id ${this.chatbotIdValue}.`)
    this.channel = createConsumer().subscriptions.create(
      { channel: "ChatbotChannel", id: this.chatbotIdValue },
      { received: data => this.#insertMessageAndScrollDown(data) }
    )
  }

  #insertMessageAndScrollDown(data) {
    this.messagesTarget.insertAdjacentHTML("beforeend", data)
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }

  resetForm(event) {
    event.target.reset()
  }

  disconnect() {
    console.log("Unsubscribed from the chatbot")
    this.channel.unsubscribe()
  }
}
  // received: data => this.messagesTarget.insertAdjacentHTML("beforeend", data)
