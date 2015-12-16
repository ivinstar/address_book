class Web::AddressesController < Web::ApplicationController

  def index
    @search = @model.search {}
    @addresses = @search.result.page(1).per(1)
  end


  private

  def set_model
    @model = Address
  end

end