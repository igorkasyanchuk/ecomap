class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin!

  layout 'admin'

  private

  def require_admin!
    current_user.admin?
  end
end
