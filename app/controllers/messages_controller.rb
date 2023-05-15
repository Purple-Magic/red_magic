class MessagesController < ApplicationController
  def index
    @messages = Message.all
    @message = Message.new
    @snapshots = Snapshot.all
    @snapshot = Snapshot.new
  end

  def create
    @message = Message.create! text: params[:message][:text], photo: params[:message][:photo]
  end
end
