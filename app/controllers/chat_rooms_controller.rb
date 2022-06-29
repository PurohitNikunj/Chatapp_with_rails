class ChatRoomsController < ApplicationController
  skip_before_action :not_loggedin
  before_action :set_chat_room, only: [:show, :destroy, :join_room]
  before_action :is_authenticated

  def index
    room_user = RoomUser.owner.where.not(user_id:current_user.id).distinct.pluck(:chat_room_id)
    @chat_rooms = ChatRoom.where(id: room_user)
  end

  def new
    @chat_room = ChatRoom.new()
  end

  def create
    @chat_room = ChatRoom.new(name: params[:chat_room][:name])
    if @chat_room.save
      @room_user = @chat_room.room_users.new()
      @room_user.user_id = current_user.id
      @room_user.status = 1
      @room_user.save
      redirect_to root_path
    end
  end
  
  def join_room
    owner = RoomUser.owner.find_by(chat_room_id:@chat_room.id)
    r = Request.new(room_id:@chat_room.id, user_id:current_user.id, request_status:0, owner_id:owner.user_id)
    if r.save
      redirect_to root_path
    end
  end

  def owner
    requests = Request.pending.where(owner_id:current_user.id).pluck(:room_id)
    @chat_rooms = ChatRoom.where(id: requests)
  end

  def see_request
    @requests = Request.pending.where(owner_id:current_user.id).where(room_id:params[:chat_room_id])
  end

  def accept_request
    request = Request.pending.where(owner_id:current_user.id).where(room_id:params[:chat_room_id]).find_by(user_id:params[:requester_id])
    request.request_status = 1
    request.save
    room_user = RoomUser.new(user_id:params[:requester_id], chat_room_id:params[:chat_room_id], status:0)
    if room_user.save 
      redirect_to root_path
    end
    # binding.pry
  end

  def reject_request
    request = Request.pending.where(owner_id:current_user.id).where(room_id:params[:chat_room_id]).find_by(user_id:params[:requester_id])
    request.destroy
    redirect_to root_path
  end

  private
  def set_chat_room
    @chat_room = ChatRoom.find(params[:chat_room_id])
  end
end
