class Api::AddressesController < Api::ApplicationController

  before_filter :sanitize_params, only: [:index]

  def index
    @search = @model.search @q
    @addresses = @search.result.page(params[:page] || 1)
  end

  private

  def sanitize_params
    @q = JSON.parse params[:q] || {}
  end

  def set_model
    @model = Address
  end

end