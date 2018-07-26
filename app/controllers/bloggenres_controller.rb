class BloggenresController < ApplicationController
  layout = "bloggenres"

  def index
    @data = Bloggenre.all
  end

  def add
    @bloggenre = Bloggenre.new
    if request.post? then
      @bloggenre = Bloggenre.new bloggenre_params
      if @bloggenre.save
        redirect_to '/bloggenres'
      end
    end
  end

  def edit
    @bloggenre = Bloggenre.find params[:id]
    if request.patch? then
      if @bloggenre.update bloggenre_params
        redirect_to "/bloggenres"
      end
    end
  end

  private 
  def bloggenre_params
      params.require(:bloggenre).permit(:name, :memo)
  end
end
