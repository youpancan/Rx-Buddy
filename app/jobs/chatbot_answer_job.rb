class ChatbotAnswerJob < ApplicationJob
  queue_as :default

  def perform(chatbot, message)
    message = Message.new(
      chatbot: chatbot,
      from_chatbot: true,
      content: "I dunno :/ This is the answer to your question: #{ message.content }"
    )

    if message.save
      ChatbotChannel.broadcast_to(
        chatbot,
        ApplicationController.new.render_to_string(partial: "messages/message", locals: { message: message })
      )
      head :ok
    end
  end
end
