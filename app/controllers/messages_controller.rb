class MessagesController < ApplicationController

  def create #DM用メッセージ投稿機能
    #もしEntryモデルに、user_idが自分のIDで、paramsで送信されたroom_idとmessageが存在したら？
    if Entry.where(user_id: current_user.id, room_id: params[:message][:room_id]).present?
      #メッセージをcreate(new & save(params))
      @message = Message.create(params.require(:message).permit(:user_id, :content, :room_id).merge(user_id: current_user.id))
      #メッセージを送信したページへリダイレクト
      redirect_to "/rooms/#{@message.room_id}?#{@message.id}"
    else
      #6行目の条件が存在しなかったらルーム一覧へリダイレクト
      redirect_back(fallback_location: rooms_path)
    end
  end

end
