class TransactionsController < ApplicationController
  def index
    @transactions = @account.transactions
  end

  private

  def find_account
    @account = Account.find_by_number(params[:account_id])
  end
end
