class MessagesController < ApplicationController
	def create
		@conversation = Conversation.find(params[:message][:conversation_id].to_i)
		@message = Message.create(user: current_user,
                                       conversation: @conversation,
                                       body: params[:message][:body]
					)
		logger.info "---------"+@message.to_json
		ChatChannel.broadcast_to @conversation, @message
	end
end
