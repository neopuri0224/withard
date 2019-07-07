class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
	posts_path
  end

  def after_sign_out_path_for(resource)
	root_path
  end

  Refile.secret_key = '52afb7fad6822ae9930690cedd19677f83d39ae2160a397e250b3e4baadb44a6f41b20631a8dda4a2752f50125e306f33e1dfed980875e1ff7b2c752aefa7d12'
end
