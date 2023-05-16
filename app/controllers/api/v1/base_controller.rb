# frozen_string_literal: true

class API::V1::BaseController < ApplicationController
  before_action :allow_json_only!

  private

  def allow_json_only!
    head :not_found unless request.format.json?
  end
end
