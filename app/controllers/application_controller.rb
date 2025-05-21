class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  include SeoHelper

  # # Devise configuration
  # before_action :authenticate_user!, except: [:index, :show]
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    # Permit additional fields for sign up
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :first_name,
      :last_name,
      :website_url,
      :promo_code,
      :join_affiliate_program
    ])

    # Permit additional fields for account update
    devise_parameter_sanitizer.permit(:account_update, keys: [
      :first_name,
      :last_name,
      :website_url
    ])
  end

  # def after_sign_in_path_for(resource)
  #   case resource.role
  #   when 'admin'
  #     admin_dashboards_path
  #   when 'trader'
  #     traders_dashboards_path
  #   when 'affiliate'
  #     affiliates_dashboards_path
  #   else
  #     root_path
  #   end
  # end
end
