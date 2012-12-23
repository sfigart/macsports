class RegistrationsController < ApplicationController
  before_filter :authenticate_user!, :except => [:new, :create, :thankyou]
  
  # GET /registrations
  # GET /registrations.json
  def index
    @type = registration_type
    @registrations = registration_type.all(:order => :id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @registrations }
      format.csv { send_data registration_type.to_csv }
      format.xls { render :template => "/registrations/#{registration_type.to_s.downcase}/index.xls.erb" }
    end
  end

  # GET /registrations/1
  # GET /registrations/1.json
  def show
    @registration = registration_type.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @registration }
    end
  end

  # GET /registrations/new
  # GET /registrations/new.json
  def new
    @registration = registration_type.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @registration }
    end
  end

  # GET /registrations/1/edit
  def edit
    @registration = registration_type.find(params[:id])
  end

  # POST /registrations
  # POST /registrations.json
  def create
    @registration = registration_type.new(params[registration_type.to_s.downcase])
    @registration.record_request_info(request)
    
    respond_to do |format|
      if @registration.save
        send_email_notice(@registration)

        format.html { redirect_to (polymorphic_path(@registration)+"/thankyou") }
        format.json { render json: @registration, status: :created, location: @registration }
      else
        format.html { render action: "new" }
        format.json { render json: @registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /registrations/1
  # PUT /registrations/1.json
  def update
    @registration = registration_type.find(params[:id])

    respond_to do |format|
      if @registration.update_attributes(params[registration_type.to_s.downcase])

        # TODO: TESTING
        send_email_notice(@registration)

        format.html { redirect_to @registration, notice: 'Registration was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registrations/1
  # DELETE /registrations/1.json
  def destroy
    @registration = registration_type.find(params[:id])
    @registration.destroy

    respond_to do |format|
      format.html { redirect_to polymorphic_url(@registration.class) }
      format.json { head :no_content }
    end
  end
  
  # GET /registrations/1/thankyou
  def thankyou
    @registration = registration_type.find(params[:id])
  end
  
  private
  
  def send_email_notice(registration)
    case registration.type
    when "Volleyball"
      RegistrationMailer.registration_complete(registration).deliver
    when "Baseball"
      RegistrationMailer.baseball_agreement(registration).deliver
    end
  end
  
  # http://stackoverflow.com/questions/5246767/sti-one-controller
  def registration_type
    params[:type].constantize if params[:type]
  end
end
