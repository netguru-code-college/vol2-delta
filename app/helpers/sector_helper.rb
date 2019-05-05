module SectorHelper
  def get_route_grade(grade_route_id)
    return 'No grades found' unless grade_route_id

    RouteGrade.find(grade_route_id).grade
  end
end
