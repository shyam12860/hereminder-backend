class AlarmsController < ApplicationController
  before_action :set_alarm, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user_token

  #POST /login
  #POST /user.json
  def login
    render json: @user
  end

  # GET /alarms
  # GET /alarms.json
  def index
    @alarms = @user.alarms
    render json: @alarms
  end

  # GET /alarms/1
  # GET /alarms/1.json
  def show
  end

  # GET /alarms/false/
  def false_alarms
    alarms = @user.alarms.where(status: false)
    render json: alarms
  end

  # GET /alarms/new
  def new
    # @alarm = Alarm.new
  end

  # GET /alarms/1/edit
  def edit

  end

  # POST /alarms
  # POST /alarms.json
  def create
    @alarm = Alarm.new(alarm_params)
    @alarm.user_id = @user.id
    if params[:notify_users]
      @alarm.notify_users = params[:notify_users]
    else
      @alarm.notify_users = "[]"
    end
    if @alarm.save
      render json: @alarm
    else
      render json: @alarm.errors, status: :unprocessable_entity
    end
    # respond_to do |format|
    #   if @alarm.save
    #     format.html { redirect_to @alarm, notice: 'Alarm was successfully created.' }
    #     format.json { render :show, status: :created, location: @alarm }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @alarm.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /alarms/1
  # PATCH/PUT /alarms/1.json
  def update
    @alarm[:status] = true
    if @alarm.save
      HardWorker.perform_async(@alarm.id)
      render json: @alarm
      
    else
      render json: @alarm.erros, status: :unprocessable_entity
    end
    # respond_to do |format|
    #   if @alarm.update(alarm_params)
    #     format.html { redirect_to @alarm, notice: 'Alarm was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @alarm }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @alarm.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /alarms/1
  # DELETE /alarms/1.json
  def destroy
    if Alarm.exists?(@alarm.id)
      @alarm.destroy
      render json: @alarm, status: 200
    else
      render json: {error: "Invalid alarm id"}, status: 404
    end
    # respond_to do |format|
    #   format.html { redirect_to alarms_url, notice: 'Alarm was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alarm
      @alarm = Alarm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def alarm_params
      params.permit(:title, :note, :latitude, :longitude, :user_id, :address, :radius, :status, :notify_users)
    end
end
