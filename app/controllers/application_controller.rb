class ApplicationController < ActionController::Base
  before_action :set_locale
  protect_from_forgery with: :exception
  include SessionsHelper

  private

  def set_locale
    locale = params[:locale].to_s.strip.to_sym
    I18n.locale = I18n.available_locales.include?(locale) ? locale : I18n.default_locale
  end

  def default_url_options (options = {})
    { locale: I18n.locale }.merge options
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = t(:please_log_in)
      redirect_to login_url
    end
  end
end
