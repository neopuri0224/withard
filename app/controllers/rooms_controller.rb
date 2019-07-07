class RoomsController < ApplicationController

  def index #current_userのルーム一覧
    @currentEntries = current_user.entries
    #ハッシュの空き箱を作成
    myRoomIds = []
    #@currentEntriesで取得したcurrent_userの全てのエントリーのidを一つずつmyRoomIdsに入れる
    @currentEntries.each do |entry|
      myRoomIds << entry.room.id
    end
    #Entryモデルからroom_idがmyRoomIdsに入っているIDと同じで、user_idがcurrent_user.id以外のレコードを全て取り出す。
    @anotherEntries = Entry.where(room_id: myRoomIds).where('user_id != ?',current_user.id)
  end

  def show
    @room = Room.find(params[:id])
    #もしEntryモデルにuser_idがcurrent_user.idでroom_idが@roomのidのレコードが存在したら
    if Entry.where(user_id: current_user.id, room_id: @room.id).present?
      #@roomのidと同じroom_idを持ったのmessageを全て取得
      @messages = @room.messages
      @message = Message.new
      #@roomの参加者を取得
      @entries = @room.entries
    else
      #roomが存在しなかったら一覧へ戻る
      redirect_back(fallback_location: rooms_path)
    end
  end

  def create
  	@room = Room.create
    #current_userをroomの参加者として登録
    @entry1 = Entry.create(room_id: @room.id, user_id: current_user.id)
    #paramsで送信されたuser_idを持つユーザーをroomの参加者として登録
    @entry2 = Entry.create(params.require(:entry).permit(:user_id, :room_id).merge(:room_id => @room.id))
    flash[:notice] = "#{@entry2.user.name}さんとのトークルームを作成しました。"
    redirect_to room_path(@room)
  end

end
