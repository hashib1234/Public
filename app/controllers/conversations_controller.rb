class ConversationsController < ApplicationController
	def create
    @conversation = Conversation.get(current_user.id, params[:user_id])
    
    add_to_conversations unless conversated?

    @send_user = User.find(params[:user_id])

    @message= Message.new
  end

  private

  def add_to_conversations
    session[:conversations] ||= []
    session[:conversations] << @conversation.id
  end

  def conversated?
  	return false if session[:conversations].nil?
    session[:conversations].include?(@conversation.id)
  end
end
