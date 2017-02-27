class Api::V1::HotsController < ApplicationController
  def index
    HotReadsService.update_urls(params["url"])
  end
end
