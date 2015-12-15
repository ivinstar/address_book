class Web::AddressesController < Web::ApplicationController

  before_filter :set_model, only: [:index]

  def index
    @addresses = @model.page(params[:page]).per(30)
  end


  private

  def set_model
    @model = Address
  end

end