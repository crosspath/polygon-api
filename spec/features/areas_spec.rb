require 'rails_helper'

RSpec.describe "Areas" do
  it 'is loaded as json' do
    expect { AreasListLoaderForm.raw }.not_to raise_error
    expect(AreasListLoaderForm.raw).to be_an_instance_of(String)
  end
  
  it 'is loaded for checking location' do
    expect { AreasListLoaderForm.from_file }.not_to raise_error
    expect(AreasListLoaderForm.from_file).to be_an_instance_of(AreasList)
  end
  
  it 'should include point near peak' do
    point = Point.new(7.36083984375, 50.666872321810712)
    AreasListForm.includes_point?(AreasListLoaderForm.from_file, point)
  end
  
  it 'should include point near edge' do
    point = Point.new(25,-11.5)
    AreasListForm.includes_point?(AreasListLoaderForm.from_file, point)
  end
  
  it 'should not include point' do
    point = Point.new(25, -10) # Far enough. Also: 25,-11.44
    AreasListForm.includes_point?(AreasListLoaderForm.from_file, point)
  end
end
