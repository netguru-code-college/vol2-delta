module UserProfileHelper
  def find_ascent_grade route_grade_id
    RouteGrade.find(route_grade_id).grade
  end

  def full_user_name user
    user.first_name + " " + user.last_name
  end

  def user_full_name(user:)
    "#{user.first_name} #{user.last_name}"
  end
end
