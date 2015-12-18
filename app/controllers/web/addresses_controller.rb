class Web::AddressesController < Web::ApplicationController

  before_action :set_address, only: [:edit, :update, :destroy]

  def index
    @search = @model.search {}
    @addresses = @search.result.page(1).per(1)
  end

  def new
    @address = Address.new

    add_breadcrumb @model.model_name.human, :addresses_path
    add_breadcrumb I18n.t(:new), :new_address_path
  end

  def edit

    add_breadcrumb @model.model_name.human, :addresses_path
    add_breadcrumb @address, :edit_address_path
  end

  def destroy
    @address.destroy
    redirect_to url_for(action: :index), flash: {success: t(:row_deleted)}
  end

  def create
    @address = @model.new(permit_params)
    if @address.save
      redirect_to url_for(action: :index), flash: {success: t(:row_created)}
    else
      flash.now[:error] = @address.errors.full_messages
      render :new
    end
  end

  def update
    if @address.update(permit_params)
      redirect_to url_for(action: :index), flash: {success: t(:row_updated)}
    else
      flash.now[:error] = @address.errors.full_messages
      render :edit
    end
  end


  def set_model
    @model = Address
  end

  private

  def set_address
    @address = @model.find(params[:id])
  end

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