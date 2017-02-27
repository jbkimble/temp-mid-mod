class Api::V1::LinksController < ApplicationController

  def create
    if URI.parse(link_params["url"]).host && (params["title"] != "")
      @link = Link.new link_params
      @link.user_id = current_user.id
      @link.save
      render json: @link, status: 201
    else
      # @link = Link.new link_params
      # @link.save
      flash[:failure] = "URL must be valid and lead with 'http://' or 'https://'"
      redirect_to :login
      # render json: @link.errors.full_messages, status: 500
      # render links_path
    end
  end

  def update
    @link = Link.find params[:id]
    @link.assign_attributes link_params
    just_read = @link.read_changed? && @link.read
    if @link.save
      Read.create(link: @link) if just_read
      head :no_content
    else
      render json: @link.errors.full_messages, status: 500
    end
  end

  private

  def link_params
    params.permit(:title, :url, :read)
  end
end
