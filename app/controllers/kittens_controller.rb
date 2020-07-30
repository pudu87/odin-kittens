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
  end

  def show
  end

  def edit
  end

  def update
    @kitten.update(kitten_params)
  end

  def destroy
    @kitten.destroy
  end

  private

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end

  def set_kitten
    @kitten = Kitten.find(params[:id])
  end
end
