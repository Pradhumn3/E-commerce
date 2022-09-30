class AddressesController < ApplicationController
  before_action :set_address, only: [:show, :destroy, :update, :edit]
  
  def index
    @addresses = current_user.addresses
  end
  
  def new
    @address = Address.new
  end

  def create
    current_user.addresses.create!(address_params)
    flash[:notice] = "Address was successfully created."
    redirect_to addresses_url
  end

  def show ;end
  
  def edit ;end

  def update
    if @address.update_attributes(address_params)
      flash[:notice] = "Address was successfully updated."
      redirect_to addresses_url
    end
  end

  def destroy
    @address.destroy
    flash[:notice] = "Address was successfully deleted."
    redirect_to addresses_url
  end

  private

  def address_params
    params.require(:address).permit(:house_no, :area, :land_mark, :city)
  end

  def set_address
    @address = current_user.addresses.find(params[:id])
  end
end
