class TippsController < ApplicationController
  # GET /tipps
  # GET /tipps.json
  def index
    @tipps = Tipp.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tipps }
    end
  end

  # GET /tipps/1
  # GET /tipps/1.json
  def show
    @tipp = Tipp.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tipp }
    end
  end

  # GET /tipps/new
  # GET /tipps/new.json
  def new
    @tipp = Tipp.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tipp }
    end
  end

  # GET /tipps/1/edit
  def edit
    @tipp = Tipp.find(params[:id])
  end

  # POST /tipps
  # POST /tipps.json
  def create
    @tipp = Tipp.new(params[:tipp])

    respond_to do |format|
      if @tipp.save
        format.html { redirect_to @tipp, notice: 'Tipp was successfully created.' }
        format.json { render json: @tipp, status: :created, location: @tipp }
      else
        format.html { render action: "new" }
        format.json { render json: @tipp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tipps/1
  # PUT /tipps/1.json
  def update
    @tipp = Tipp.find(params[:id])

    respond_to do |format|
      if @tipp.update_attributes(params[:tipp])
        format.html { redirect_to @tipp, notice: 'Tipp was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tipp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipps/1
  # DELETE /tipps/1.json
  def destroy
    @tipp = Tipp.find(params[:id])
    @tipp.destroy

    respond_to do |format|
      format.html { redirect_to tipps_url }
      format.json { head :no_content }
    end
  end
end
