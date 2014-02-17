class TagsController < ApplicationController
  before_filter :find_account
  before_filter :find_tag, only: [:edit, :update, :destroy]
  def index
    @tags = @account.tags
  end

  def new
    @tag = @account.tags.build
  end

  def create
    @tag = @account.tags.build(tag_params)
    if @tag.save
      redirect_to account_tags_path(@account)
    end
  end

  def edit
  end

  def update
    if @tag.update_attributes(tag_params)
      redirect_to account_tags_path(@account)
    end
  end

  def destroy
    if @tag.destroy
      redirect_to account_tags_path(@account)
    end
  end

  private

  def find_tag
    @tag = @account.tags.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:name, :pattern)
  end
end
