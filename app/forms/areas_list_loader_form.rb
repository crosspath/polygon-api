module AreasListLoaderForm
  module_function
  
  FILE_NAME = Rails.root.join('app/blobs/given-areas.json').to_s
  
  def raw(file = FILE_NAME)
    File.read(file)
  end
  
  def from_file(file = FILE_NAME)
    j = JSON.parse(raw(file), symbolize_names: true)
    
    polygons = (j[:features] || []).map do |ft|
      points = ft[:geometry][:coordinates][0].map { |pt| Point.new(*pt) }
      Polygon.new(points)
    end
    
    AreasList.new(polygons)
  end
end
