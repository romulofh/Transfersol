class AgenciesController < ApplicationController
    def new
        @agency = Agency.new
    end

    def create
        @agency = Agency.new(agency_params)
        if @agency.save
            flash[:notice] = "Agencia cadastrada com sucesso"
            redirect_to agencies_path
        else
            render 'new'
        end
    end

    def index
        @agencies = Agency.all
    end

    def show
        @agency = Agency.find(params[:id])
    end

    private
    def agency_params
        params.require(:agency).permit(:number, :address)
    end

end