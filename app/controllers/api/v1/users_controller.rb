class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  before_action :set_page, only: [:index]
  before_action :validate_credentials, only: [:show]

  # GET /users
  def index
    puts ">>>>>>>>>>>>>>>>>>>>>> #{ @page }"
    @users = User.order(created_at: :asc).limit(5).offset(@page * 5)
    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: api_v1_user_url(@user)
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use for get pagination
    def set_page
      @page = 0
      if !params[:page].nil?        
        @page = params[:page].to_i
      end
    end

    # Used for client credential validation
    def validate_credentials
      if request.headers["client-id"] == "123456789" && request.headers["client-secret"] == "123456789"
      else
        render json: { error: 'Access denied' }, status: 401
      end      
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:id, :email, :first_name, :last_name, :avatar)
    end
end
