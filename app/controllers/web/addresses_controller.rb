class Web::AddressesController < Web::ApplicationController

  def index
    @addresses = Address.limit(100)
  end

end