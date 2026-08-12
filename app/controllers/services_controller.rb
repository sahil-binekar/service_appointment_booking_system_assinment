class ServicesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  def create_working_hours
    binding.pry
    @service = Service.create(name: params[:service][:name], working_hours: params[:service][:working_hours])
    if @service.save
    	response_format({data: @service})
    end
  end

  def service_params
  	params.require(:service).permit(:name, :working_hours)
  end
end
