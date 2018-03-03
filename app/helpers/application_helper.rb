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

  def nav_items
    [
      {
        url: root_path,
        controller: 'static_pages',
        action: 'index',
        title: 'Home'
      },
      {
        url: ranking_index_path,
        controller: 'ranking',
        title: 'Ranking'
      },
      {
        url: crags_path,
        controller: 'crags',
        title: 'Crags',
      },
      {
        url: climbing_routes_path,
        controller: 'climbing_routes',
        title: 'Climbing routes',
      },
      {
        url: rules_path,
        controller: 'static_pages',
        action: 'rules',
        title: 'Rules'
      },
      {
        url: contact_path,
        controller: 'static_pages',
        action: 'contact',
        title: 'Contact'
      },
      {
         url: about_path,
         controller: 'static_pages',
         action: 'about',
         title: 'About'
       }
    ]
  end

  def nav_helper style, tag_type
    nav_links = ''

    nav_items.each do |item|
      nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{active?(item[:controller], item[:action])}'>#{item[:title]}</a></#{tag_type}>"
    end
    nav_links.html_safe
  end

  def active?(controller, action)
    if controller_name == controller && action_name == action
      "active"
    elsif controller_name != 'static_pages' && controller_name == controller
      "active"
    end
  end
end
