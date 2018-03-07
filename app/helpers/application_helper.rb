module ApplicationHelper
  def body_attributes
    { class: body_class, id: body_id }
  end

  def body_class
    [controller.controller_name.dasherize + '-controller']
  end

  def body_id
    "#{controller.controller_name.dasherize}-#{controller.action_name.dasherize}"
  end

  def navbar_helper
  end

  def navbar_active(current_controller = nil, current_action = nil)
    if current_controller && current_action
      controller_name == current_controller && action_name == current_action ? 'active' : ''
    elsif current_controller
      controller_name == current_controller ? 'active' : ''
    end
  end
end
