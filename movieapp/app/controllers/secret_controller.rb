class SecretController < ApplicationController

	before_action :authenticate_user!
	
  def index
  end

  def really_secret
  end
end
