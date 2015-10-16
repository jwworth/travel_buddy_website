class DocumentsController < ApplicationController
  before_action :user
  before_action :document, only: [:show, :edit, :update, :destroy]

  def index
    @documents = Document.where(user_id: current_user.id)
  end

  def new
    @document = Document.new
    # Below works for new and create, required for create.
    # @document = @user.documents.new
  end

  def create
    @document = @user.documents.new(document_params)
    if @document.save
      redirect_to documents_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @document.update(document_params)
      redirect_to documents_path
    else
      render :edit
    end
  end

  def destroy
    @document.destroy
    redirect_to documents_path
  end

  private

  def user
    @user = current_user
  end

  def document
    @document = Document.find(params[:id])
  end

  def document_params
    params.require(:document).permit(:name, :expiration_date, :attachment)
  end

end
