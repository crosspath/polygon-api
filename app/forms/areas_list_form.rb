module AreasListForm
  module_function
  
  def includes_point?(areas_list, point)
    areas_list.polygons.any? do |po|
      PolygonForm.includes_point?(po, point)
    end
  end
end
