class ApplicationController < ActionController::Base
  before_action :switch_locale

  private

  def switch_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    { locale: I18n.locale }
  end
end
