module UserProfileHelper
  def find_ascent_grade route_grade_id
    RouteGrade.find(route_grade_id).grade
  end
end
