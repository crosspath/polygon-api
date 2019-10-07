module PolygonForm
  module_function
  
  def includes_point?(polygon, point)
    points = polygon.points
    
    result = false
    
    points.each_with_index do |el, index|
      prev = points[index - 1]
      
      # check crossing lines
      fy = (el.y > point.y) != (prev.y > point.y)
      fx = point.x < el.x + (prev.x - el.x) * (point.y - el.y) / (prev.y - el.y)
      
      result = !result if fy && fx
    end
    
    result
  end
end
