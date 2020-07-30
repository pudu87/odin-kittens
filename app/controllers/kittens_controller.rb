class KittensController < ApplicationController
  before_action :set_kitten, only: [:show, :edit, :update, :destroy]

  def index
    @kittens = Kitten.all
  end

  def new
    @kitten = Kitten.new
  end
  
  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      flash[:notice] = "You have created #{@kitten.name}"
      redirect_to root_path
    else
      flash[:notice] = "Failed, try again"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @kitten.update(kitten_params)
      flash[:notice] = "You have updated #{@kitten.name}"
      redirect_to kitten_path(@kitten)
    else
      flash[:notice] = "Failed, try again"
      render edit_kitten_path(@kitten)
    end
  end

  def destroy
    @kitten.destroy
    flash[:notice] = "You have deleted #{@kitten.name}"
    redirect_to root_path
  end

  private

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end

  def set_kitten
    @kitten = Kitten.find(params[:id])
  end
end
