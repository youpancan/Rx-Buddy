class ChatbotAnswerJob < ApplicationJob
  queue_as :default

  def perform(chatbot, user_message)
    chatbot_answer = Message.new(
      chatbot: chatbot,
      from_chatbot: true,
      content: "script."
    )

    if chatbot_answer.save
      ChatbotChannel.broadcast_to(
        chatbot,
        message: ApplicationController.new.render_to_string(partial: "messages/message", locals: { message: chatbot_answer })
      )
    end
  end
end
