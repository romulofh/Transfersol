class AccountsController < ApplicationController

    def new
        @account = Account.new
    end

    def edit
        @account = Account.find(params[:id])
    end

    def create
        @account = Account.new(account_params)
        numero_agencia = @account.agencia
        @account.agency = Agency.find_by(number: numero_agencia)
        if @account.save
            flash[:notice] = "Conta cadastrada com sucesso"
            redirect_to accounts_path
        else
            flash[:danger] = "Conta já cadastrada ou campos preenchidos incorretamentes"
            render 'new'
        end
    end

    def index
        @accounts = Account.all
    end

    def show
        @account = Account.find(params[:id])
    end

    def update
        @account = Account.find(params[:id])
        if @account.update(account_params)
            flash[:notice] = "Conta atualizada com sucesso"
            redirect_to account_path(@account)
        else
            render 'edit'
        end
    end

    def destroy
        @account = Account.find(params[:id])
        @account.destroy
        flash[:notice] = "Conta excluida com sucesso"
        redirect_to accounts_path
    end

    def deposito
        
    end

    private
    def account_params
        params.require(:account).permit(:number, :limit, :agencia)
    end

end