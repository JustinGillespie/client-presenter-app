class DashboardController < ApplicationController
	before_filter :authorize

  def index
  	@clients = Client.all
  end
  
end
