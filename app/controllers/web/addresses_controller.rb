class Web::AddressesController < Web::ApplicationController

  def index
    @addresses = Address.page(params[:page]).per(30)
  end

end