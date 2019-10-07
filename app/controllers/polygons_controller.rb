class PolygonsController < ApplicationController
  def index
    f = AreasListLoaderForm.raw
    
    render body: f, content_type: 'application/json'
  rescue => e
    response_error(e)
  end
end
