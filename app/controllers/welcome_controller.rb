class WelcomeController < ApplicationController

  def index
    @survey = Survey::Survey.where(name: "Mommy Styles Survey").first
  end

end