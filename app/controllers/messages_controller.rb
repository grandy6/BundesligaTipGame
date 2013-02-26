class MessagesController < ApplicationController
  load_and_authorize_resource :only => [:index, :show]
  # GET /messages
  # GET /messages.json
  def index
    to = current_user.user_messages.select(:message_id)
    to_array = Array.new
    to.each do |u|
      to_array << u.message_id
    end
    @inbox = Message.where(id: to_array)
    @outbox = Message.where(from: current_user.id)
    #@messages = Message.where(to: current_user.id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @messages }
    end
  end 
  # GET /messages/1
  # GET /messages/1.json
  def show
    @message = Message.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @message }
    end
  end

  # GET /messages/new
  # GET /messages/new.json
  def new
    @message = Message.new
    # if !params[:to].nil?
    #   params[:to].each do |p|
    #     #@message.to.push(User.find(p))
    #     @message.users.push(User.find(p))
    #   end
    # end
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @message }
    end
  end

  # GET /messages/1/edit
  def edit
    @message = Message.find(params[:id])
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(params[:message])
    @message.from = current_user.id

    m = params[:message]
    @message.users = Array.new
    m[:user_ids].to_s.split(',').each {|i| @message.users << User.find(i) }
      
    respond_to do |format|
      if @message.save
        format.html { redirect_to @message, notice: 'Message was successfully created.' }
        format.json { render json: @message, status: :created, location: @message }
      else
        format.html { render action: "new" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /messages/1
  # PUT /messages/1.json
  def update
    @message = Message.find(params[:id])

    respond_to do |format|
      if @message.update_attributes(params[:message])
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    respond_to do |format|
      format.html { redirect_to messages_url }
      format.json { head :no_content }
    end
  end
end
