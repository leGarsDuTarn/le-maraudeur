class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    @maraudes = current_user.maraudes
    @maraude = Maraude.new
  end
end
