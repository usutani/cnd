class NetworkDataController < ApplicationController
  REALM = "Xdaoh23sArJsHe"

  before_filter :authenticate

  # GET /network_data
  # GET /network_data.json
  def index
    @network_data = NetworkDatum.order(:created_at).page params[:page]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @network_data }
    end
  end

  # GET /network_data/1
  # GET /network_data/1.json
  def show
    @network_datum = NetworkDatum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @network_datum }
    end
  end

  # GET /network_data/new
  # GET /network_data/new.json
  def new
    @network_datum = NetworkDatum.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @network_datum }
    end
  end

  # GET /network_data/1/edit
  def edit
    @network_datum = NetworkDatum.find(params[:id])
  end

  # POST /network_data
  # POST /network_data.json
  def create
    @network_datum = NetworkDatum.new(params[:network_datum])

    respond_to do |format|
      if @network_datum.save
        format.html { redirect_to @network_datum, notice: 'Network datum was successfully created.' }
        format.json { render json: @network_datum, status: :created, location: @network_datum }
      else
        format.html { render action: "new" }
        format.json { render json: @network_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /network_data/1
  # PUT /network_data/1.json
  def update
    @network_datum = NetworkDatum.find(params[:id])

    respond_to do |format|
      if @network_datum.update_attributes(params[:network_datum])
        format.html { redirect_to @network_datum, notice: 'Network datum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @network_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /network_data/1
  # DELETE /network_data/1.json
  def destroy
    @network_datum = NetworkDatum.find(params[:id])
    @network_datum.destroy

    respond_to do |format|
      format.html { redirect_to network_data_url }
      format.json { head :no_content }
    end
  end

  private

  def authenticate
    name, pw = ENV["BASIC_AUTH_NAME"], ENV["BASIC_AUTH_PW"]
    return if name.nil? || pw.nil?
    users = { name => pw }
    authenticate_or_request_with_http_digest(REALM) do |username|
      users[username]
    end
  end
end
