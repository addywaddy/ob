class TransactionsController < ApplicationController
  before_filter :find_account
  def index
    @transactions = @account.transactions
  end

  def show
    @transaction = @account.transactions.find(params[:transaction])
  end
end
