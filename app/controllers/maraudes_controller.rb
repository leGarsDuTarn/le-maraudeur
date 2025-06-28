class MaraudesController < ApplicationController
  before_action :set_maraude, only: [:show, :edit, :update, :destroy]
  def index
    @maraudes = Maraude.all
  end

  def show
    @maraude
  end

  def new
    @maraude = Maraude.new
  end

  def edit
    @maraude
  end

  def create
    @maraude = Maraude.new(maraude_params)
    @maraude.user = current_user
      if @maraude.save
        redirect_to dashboard_path, notice: 'La maraude a été créée avec succès.'
      else
        render :new, status: :unprocessable_entity
      end
  end

  def update
    if @maraude.update(maraude_params)
      redirect_to dashboard_path, notice: 'La maraude a été modifié avec succès.', status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @maraude.destroy
      redirect_to dashboard_path, notice: 'La maraude a été supprimé avec succès.'
    else
      redirect_to dashboard_path, alert: "La maraude n'a pas pu être supprimée."
    end
  end

  private

  def set_maraude
    @maraude = Maraude.find(params[:id])
  end

  def maraude_params
    params.require(:maraude).permit(:place, :date, :hour, :action)
  end
end
