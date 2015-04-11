class AddressesController < ApplicationController
    def forward_user
        @address = Address.find_by_name(params[:name])
        redirect_to @address.location
    end
end
