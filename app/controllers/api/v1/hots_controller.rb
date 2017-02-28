class Api::V1::HotsController < ApplicationController
  def index
    render json: Link.top_ten_in_last_day
  end
end
