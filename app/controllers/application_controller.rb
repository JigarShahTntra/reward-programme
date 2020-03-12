# frozen_string_literal: true

class ApplicationController < ActionController::Base
  layout :set_layout

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_to main_app.root_url, notice: exception.message }
      format.js   { head :forbidden, content_type: 'text/html' }
    end
  end

  private

  def set_layout
    if devise_controller?
      'session'
    else
      'application'
    end
  end
end
