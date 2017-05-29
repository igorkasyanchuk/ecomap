module AdminHelper
  def active_class_by(controller)
    'active' if controller == params[:controller]
  end

  def yes_no(value)
    !!value ? 'Yes' : 'No'
  end
end
