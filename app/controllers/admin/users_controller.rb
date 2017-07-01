class Admin::UsersController < Admin::ApplicationController
  add_breadcrumb :index, :admin_users_path

  def index
    @users = User.page(params[:page])
  end

  def new
    add_breadcrumb :new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_users_path, notice: t('crud.created', subject: resource_name)
    else
      render :new
    end
  end

  def edit
    add_breadcrumb :edit
    @user = resource
  end

  def update
    @user = resource

    if @user.update(user_params)
      redirect_to admin_users_path, notice: t('crud.updated', subject: resource_name)
    else
      render :edit
    end
  end

  def destroy
    @user = resource
    @user.destroy

    redirect_back(fallback_location: admin_users_path, notice: t('crud.deleted', subject: resource_name))
  end

  private

  def resource
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :role, :email, :password, :password_confirmation)
  end

  def resource_name
    User.model_name.human
  end
end
