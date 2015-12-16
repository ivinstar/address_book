class ApplicationController < ActionController::Base

  before_action :set_model, only: [:index]


  private

  def set_model; end

end
