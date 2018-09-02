class ComplainsController < ApplicationController
  before_action :set_complain, only: [:show, :update, :destroy]

  # GET /complains
  def index
    @complains = Complain.all

    render json: @complains
  end

  # GET /complains/1
  def show
    render json: @complain
  end

  # POST /complains
  def create
    @user = User.find(1)
    @complain = @user.complains.create complain_params
    if @complain.save
      render json: @complain
    else
      render json: @complain.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /complains/1
  def update
    if @complain.update(complain_params)
      render json: @complain
    else
      render json: @complain.errors, status: :unprocessable_entity
    end
  end

  # DELETE /complains/1
  def destroy
    @complain.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_complain
      @complain = Complain.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def complain_params
      json = params.require(:complain)
      {complain: JSON.parse(json).permit(:complain)}
    end
end
