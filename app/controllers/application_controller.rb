# frozen_string_literal: true

class ApplicationController < ActionController::Base
  add_flash_types :success, :error

  def paginate(records)
    records.page(params[:page])
  end
end
