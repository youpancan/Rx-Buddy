import { Controller } from "@hotwired/stimulus"

import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { chatbotId: Number }
  static targets = ["messages"]
  static values = { chatbotId: Number, currentUserId: Number }

  connect() {
    console.log(`Subscribe to the chatbot with the id ${this.chatbotIdValue}.`)
    this.channel = createConsumer().subscriptions.create(
      { channel: "ChatbotChannel", id: this.chatbotIdValue },
      { received: data => this.#insertMessageAndScrollDown(data) }
    )
  }

  // #insertMessageAndScrollDown(data) {
  //   this.messagesTarget.insertAdjacentHTML("beforeend", data)
  //   this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  // }

  resetForm(event) {
    event.target.reset()
  }

  disconnect() {
    console.log("Unsubscribed from the chatbot")
    this.channel.unsubscribe()
  }

  // #insertMessageAndScrollDown(data) {
  //   // Logic to know if the sender is the current_user
  //   const currentUserIsSender = this.currentUserIdValue === data.sender_id
  //   // [...]
  // }

  #buildMessageElement(currentUserIsSender, message) {
    return `
      <div class="message-row d-flex ${this.#justifyClass(currentUserIsSender)}">
        <div class="${this.#userStyleClass(currentUserIsSender)}">
          ${message}
        </div>
      </div>
    `
  }

  #justifyClass(currentUserIsSender) {
    return currentUserIsSender ? "justify-content-end" : "justify-content-start"
  }

  #userStyleClass(currentUserIsSender) {
    return currentUserIsSender ? "sender-style" : "receiver-style"
  }

  #insertMessageAndScrollDown(data) {
    console.log("received", data)
    // Logic to know if the sender is the current_user
    const currentUserIsSender = this.currentUserIdValue === data.sender_id

    // Creating the whole message from the `data.message` String
    const messageElement = this.#buildMessageElement(currentUserIsSender, data.message)

    // Inserting the `message` in the DOM
    this.messagesTarget.insertAdjacentHTML("beforeend", messageElement)
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }

}
  // received: data => this.messagesTarget.insertAdjacentHTML("beforeend", data)
