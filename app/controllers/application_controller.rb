# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  add_flash_types :success, :error

  def paginate(records)
    records.page(params[:page])
  end
end
