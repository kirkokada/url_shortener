class LinksController < ApplicationController
  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      redirect_to @link
    else
      render :new
    end
  end

  def show
    @link = Link.find(params[:id])
  end

  def redirect
    @link = Link.find_by_slug(slug_param)
    if !@link.nil?
     redirect_to @link.url
    else
      redirect_to root_path
    end
  end

  private

  def link_params
    params.require(:link).permit(:url)
  end

  def slug_param
    params[:slug].gsub(/[IO]/, "I" => "l", "O" => "0")
  end
end
