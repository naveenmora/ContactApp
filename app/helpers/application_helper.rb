module ApplicationHelper

  def locale_label
    return "English" unless params[:locale]
    
    LANGUAGES[params[:locale]]
  end

end
