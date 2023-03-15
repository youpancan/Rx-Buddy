class MessagesController < ApplicationController
  def create
    puts "create"
    @chatbot = Chatbot.find(params[:chatbot_id])
    @message = Message.new(message_params)
    @message.chatbot = @chatbot
    if @message.save
      ChatbotChannel.broadcast_to(
        @chatbot,
        message: render_to_string(partial: "message", locals: { message: @message }),
        sender_id: current_user.id
      )
      head :ok

      sleep 1
      ChatbotAnswerJob.perform_now(@chatbot, @message)

      # ChatbotAnswerJob.set(wait: 1.second).perform_later(@chatbot, @message)

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
