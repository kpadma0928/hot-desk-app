class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  module DefaultURLOptions
	    # Adds locale to all links
	    def default_url_options
	      { :locale => I18n.locale }
	    end
  	end

  	include DefaultURLOptions

  	before_action :set_locale

  	def set_locale
  		I18n.locale = params[:locale] || 'en'
  	end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

end
