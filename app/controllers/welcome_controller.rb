class WelcomeController < ApplicationController

  def index
    @survey = Survey::Survey.where(name: "Parenting Styles Survey").first
  end

end