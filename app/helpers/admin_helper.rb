module AdminHelper
  def active_class_by(controller)
    'active' if controller == params[:controller]
  end

  def yes_no(value)
    !!value ? I18n.t('yes_value') : I18n.t('no_value')
  end
end
