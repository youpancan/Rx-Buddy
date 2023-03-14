class ChatbotsController < ApplicationController
  def show
    @chatbot = Chatbot.find(params[:id])
    @message = Message.new
  end
end
