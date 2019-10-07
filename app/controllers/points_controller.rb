class PointsController < ApplicationController
  def check
    point = get_point
    res = AreasListForm.includes_point?(AreasListLoaderForm.from_file, point)
    
    render json: {"inside?" => res}
  rescue => e
    response_error(e)
  end
  
  private
  
  def get_point(value = params[:point])
    raise ArgumentError, "Value is empty" if value.nil? || value.empty?
    
    point = JSON.parse(value, symbolize_names: true)
    if point[:type] == 'Point' && point[:coordinates].size == 2
      Point.new(*point[:coordinates].map(&:to_f))
    else
      raise ArgumentError, "Unexpected value: #{point.inspect}"
    end
  end
end
