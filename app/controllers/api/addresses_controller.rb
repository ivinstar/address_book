class Api::AddressesController < Api::ApplicationController

  def index
    @addresses = Address.limit(20)
  end

end