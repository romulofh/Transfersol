class AgenciesController < ApplicationController
    def new
        @agency = Agency.new
    end

    def edit
        @agency = Agency.find(params[:id])
    end

    def create
        @agency = Agency.new(agency_params)
        if @agency.save
            flash[:notice] = "Agencia cadastrada com sucesso"
            redirect_to agencies_path
        else
            flash[:danger] = "Agencia já cadastrada ou campos preenchidos incorretamentes"
            render 'new'
        end
    end

    def index
        @agencies = Agency.all
    end

    def show
        @agency = Agency.find(params[:id])
    end

    def update
        @agency = Agency.find(params[:id])
        if @agency.update(agency_params)
            flash[:notice] = "Agencia atualizada com sucesso"
            redirect_to agencies_path
        else
            render 'edit'
        end
    end

    def destroy
        @agency = Agency.find(params[:id])
        @agency.destroy
        flash[:notice] = "Agência excluída com sucesso"
        redirect_to agencies_path
    end

    private
    def agency_params
        params.require(:agency).permit(:number, :address)
    end

end