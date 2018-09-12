class MovementsController < ApplicationController
    def new
        @movement = Movement.new
    end

    def create
        @movement = Movement.new(movement_params)
        @movement.user = current_user
        @movement.account = Account.find_by(number: @movement.conta_raiz)
        @account = Account.find_by(number: @movement.conta_alvo)
        target = Account.find_by(number: @movement.conta_alvo)
        if @movement.movement_type == 'Depósito'
            @movement.account.limit = @movement.account.limit + @movement.amount
            @movement.account.save
        end
        if @movement.movement_type == 'Saque'
            if @movement.amount < @movement.account.limit
                @movement.account.limit = @movement.account.limit - @movement.amount
                @movement.account.save
            else
                flash[:notice] = "Saldo insuficiente" 
                redirect_to movements_path and return
            end
        end
        if @movement.movement_type == 'Transferência'
            if @movement.amount < @movement.account.limit 
                @movement.account.limit = @movement.account.limit - @movement.amount
                @movement.account.save
                @account.limit = @account.limit + @movement.amount
                @account.save
            else
                flash[:notice] = "Saldo insuficiente" 
                redirect_to movements_path and return
            end
        end
        if @movement.save
            flash[:notice] = "Movimentação realizada com sucesso"
            redirect_to movements_path
        else
            render 'new'
        end
    end

    def index
        @movements = Movement.all
    end

    def show
        @movement = Movement.find(params[:id])
    end


    private
    def movement_params
        params.require(:movement).permit(:movement_type, :amount, :conta_raiz, :conta_alvo)
    end
end