class ChatbotChannel < ApplicationCable::Channel
    def subscribed
      chatbot = Chatbot.find(params[:id])
      stream_for chatbot
    # stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
