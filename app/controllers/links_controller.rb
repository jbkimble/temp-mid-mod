class LinksController < ApplicationController
  def index
    redirect_to welcomes_path unless current_user
    @hot_links = Link.hot

    @links = current_user.links unless current_user == nil
  end

  def update
    @link = Link.find(params["id"])
    if URI.parse(link_params["url"]).host
      @link.update(link_params)
      @link.save
      flash[:success] = "Link was successfully updated"
      redirect_to '/'
    else
      flash[:failure] = "Link failed to update. URL must be valid and lead with 'http://' or 'https://'"
      redirect_to '/'
    end
  end

  def edit
    @link = Link.find(params["id"])
  end

  private

  def link_params
    params.require(:link).permit(:title, :url)

  end
end
