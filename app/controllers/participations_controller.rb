class ParticipationsController < ApplicationController
  before_action :set_maraude, only: [:create]
  before_action :set_participation, only: [:destroy]

  def create
    @participation = Participation.new(user: current_user, maraude: @maraude)
    if @participation.save
      redirect_to dashboard_path, notice: "Votre participation a bien été prise en compte"
    else
      redirect_to dashboard_path, alert: "Une erreur est survenue lors de votre participation."
    end
  end

  def destroy
    if @participation.destroy
      redirect_to @participation.maraude, notice: "Votre participation a bien été annulée", status: :see_other
    else
      redirect_to @participation.maraude, alert: "Votre participation n'a pas pu être annulée."
    end
  end

  private

  def set_maraude
    @maraude = Maraude.find(params[:maraude_id])
  end

  def set_participation
    @participation = Participation.find(params[:id])
  end
end
