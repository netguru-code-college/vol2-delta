module ClimbingRoutesHelper
  def get_route_grade(grade_route_id)
    return 'No grades found' unless grade_route_id
    RouteGrade.find(grade_route_id).grade
  end

  def get_ascent_style(ascent_style_id)
    return 'No styles found' unless ascent_style_id
    AscentStyle.find(ascent_style_id).style
  end
end
