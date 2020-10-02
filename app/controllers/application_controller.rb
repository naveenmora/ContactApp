class ApplicationController < ActionController::Base
	add_flash_types :info, :error, :warning

	before_action :set_locale

	def render_not_found
    render :file => "#{Rails.root}/public/404.html",  :status => 404
  end

  def default_url_options
    { locale: I18n.locale }
  end

  private

    def set_locale
      I18n.locale = params[:locale] || I18n.default_locale
    end

    def browser_locale(request)
	  locales = request.env['HTTP_ACCEPT_LANGUAGE'] || ""
	    locales.scan(/[a-z]{2}(?=;)/).find do |locale|
	     I18n.available_locales.include?(locale.to_sym)
	  	end
		end
end
