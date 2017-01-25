class SenderAddressesController < ApplicationController
  before_action :find_sender_address, only: [:edit, :update, :show, :delete]
  before_action :subscription_required

  # Index action to render all sender_addresses
  def index
    @sender_addresses = current_user.sender_addresses
  end

  # New action for creating sender_address
  def new
    @sender_address = SenderAddress.new
  end

  # Create action saves the sender_address into database
  def create
    @sender_address = SenderAddress.new
    @sender_address.user = current_user
    if @sender_address.update(sender_address_params)
      flash[:notice] = "Successfully created Sender Address!"
      redirect_to sender_address_path(@sender_address)
    else
      flash[:alert] = "Error creating new Sender Address!"
      render :new
    end
  end

  # Edit action retrives the sender_address and renders the edit page
  def edit
  end

  # Update action updates the sender_address with the new information
  def update
    if @sender_address.update_attributes(sender_address_params)
      flash[:notice] = "Successfully updated Sender Address!"
      redirect_to sender_address_path(@sender_address)
    else
      flash[:alert] = "Error updating Sender Address!"
      render :edit
    end
  end

  # The show action renders the individual sender_address after retrieving the the id
  def show
  end

  # The destroy action removes the sender_address permanently from the database
  def destroy
    if @sender_address.destroy
      flash[:notice] = "Successfully deleted Sender Address!"
      redirect_to sender_addresses_path
    else
      flash[:alert] = "Error updating Sender Address!"
    end
  end

  def fetch
    respond_to do |format|
      sender_address = current_user.sender_addresses.find(params[:sender_address_id])
      if
        format.json { render json: sender_address }
      else
        format.json { render json: '', status: :unprocessable_entity }
      end
    end
  end

  private

  def sender_address_params
    params.require(:sender_address).permit(:title, :body)
  end

  def find_sender_address
    @sender_address = SenderAddress.find(params[:id])
  end
end