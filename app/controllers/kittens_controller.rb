class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
  end

  def show
    @kitten = Kitten.find(params[:id])
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save!
      flash[:notice] = 'Congratulations! We have a new kitten here!'
      redirect_to @kitten
    else
      flash[:alert] = "Check again, we don't want to deal with stupid mistakes here"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update
    @kitten = Kitten.find(params[:id])
    if @kitten.update!(kitten_params)
      flash[:notice] = 'Congratulations! Your kitten has been updated!'
      redirect_to @kitten
    else
      flash[:alert] = 'Check again, if you have to make mistakes, might as well leave it as it is'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @kitten = Kitten.find(params[:id])
    if @kitten.destroy
      flash[:notice] = 'Goodbye kitty'
      redirect_to root_path
    else
      flash[:alert] = 'The kitten resisted your attempt to deletion!'
      render @kitten, status: :unprocessable_entity
    end
  end

  private

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
