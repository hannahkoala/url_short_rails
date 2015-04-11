class AddressesController < ApplicationController
    def index
        @addresses = Address.all
        @address = Address.new
    end
    
    def forward_user
        @address = Address.find_by_name(params[:name])
            @address.clicks = @address.clicks + 1
            @address.save
        redirect_to @address.location
    end
    
    def new
        @address = Address.new
    end
    
    def create
        @address = Address.new(params.require(:address).permit(:location, :name))
        if @address.save
            redirect_to root_path
        else
            index()
            render action: "index"
        end
    end
    
    def show
        @address = Address.find(params[:id])
    end
end