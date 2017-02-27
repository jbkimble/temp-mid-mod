class LinksController < ApplicationController
  def index
    redirect_to welcomes_path unless current_user
    @hot_links = Link.hot

    @links = current_user.links unless current_user == nil
  end
end
