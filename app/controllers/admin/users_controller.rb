class Admin::UsersController < Admin::BaseController
  def index
    @users = User.page(params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_users_path, notice: 'User was successfully created'
    else
      render :new
    end
  end

  def edit
    @user = resource
  end

  def update
    @user = resource

    if @user.update(user_params)
      redirect_to admin_users_path, notice: 'User was successfully updated'
    else
      render :edit
    end
  end

  def destroy
    @user = resource
    @user.destroy

    redirect_back(fallback_location: admin_users_path, notice: 'User was successfully deleted')
  end

  private

  def resource
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :role, :email, :password, :password_confirmation)
  end
end
