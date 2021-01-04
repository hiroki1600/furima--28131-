class MessagesController < ApplicationController

  def create
    @item = Item.find(params[:item_id])
    @message = @item.messages.new(message_params)
    if @message.save
      ActionCable.server.broadcast 'message_channel', content: @message, user: @message.user
    else
      @message = @item.messages.includes(:user)
      render item_path(@item)
    end
  end

private

def message_params
  params.require(:message).permit(:content).merge(user_id: current_user.id)
end

end
