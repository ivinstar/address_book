class Web::AddressesController < Web::ApplicationController

  def index
    @search = @model.search {}
    @addresses = @search.result.page(1).per(1)
  end



  def set_model
    @model = Address
  end

  private

  def permit_params
    params.require(:address).permit(:country,
                                    :city,
                                    :street_name,
                                    :street_type,
                                    :house,
                                    :zipcode,
                                    :street,
                                    :date)
  end

end