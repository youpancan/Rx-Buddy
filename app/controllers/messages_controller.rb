class MessagesController < ApplicationController
  def create
    @chatbot = Chatbot.find(params[:chatbot_id])
    @message = Message.new(message_params)
    @message.chatbot = @chatbot
    if @message.save
      ChatbotChannel.broadcast_to(
        @chatbot,
        render_to_string(partial: "message", locals: { message: @message })
      )
      head :ok

      ChatbotAnswerJob.set(wait: 1.second).perform_later(@chatbot, @message)

      # redirect_to chatbot_path(@chatbot)
    else
      render "chatbots/show", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
