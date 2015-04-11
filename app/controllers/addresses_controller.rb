class AddressesController < ApplicationController
    def forward_user
        @address = Address.find_by_name(params[:name])
        redirect_to @address.location
    end
    
    def new
        @address = Address.new
    end
    
    def create
        @address = Address.new(params.require(:address).permit(:location, :name))
        if @address.save
            redirect_to @address
        else
            render action: "new"
        end
    end
    
    def show
        @address = Address.find(params[:id])
    end
end