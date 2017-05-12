module AdminHelper
  def active_class_by(controller)
    'active' if controller == params[:controller]
  end
end
