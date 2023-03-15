class ChatbotsController < ApplicationController
  def show
    @chatbot = Chatbot.find(params[:id])
    @message = Message.new
  end

  def create
    @chatbot = Chatbot.new(user: current_user)
    if @chatbot.save
      redirect_to chatbot_path(@chatbot)
    else
      redirect_back fallback_location: root_path, status: :unprocessable_entity
    end
  end
end
