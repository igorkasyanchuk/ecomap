class Admin::ApplicationController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin!

  add_breadcrumb I18n::t('breadcrumbs.admin.dashboard.index'), :admin_root_path

  layout 'admin'

  private

  def require_admin!
    current_user.admin?
  end
end
