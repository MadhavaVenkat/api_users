require 'rails_helper'
 
RSpec.describe "Routing User" ,type: :routing do
  it "has route to index action" do
    expect(get: '/api/users').to route_to("api/users#index")
  end
  it "has route to create action" do
    expect(post: '/api/users').to route_to("api/users#create")
  end
  it "has route to show action" do
    expect(get: '/api/users/1').to route_to("api/users#show",id:'1')
  end
  it "has route to update action" do
    expect(put: '/api/users/1').to route_to("api/users#update",id: '1')
  end
  it "has route to destroy action" do
    expect(delete: '/api/users/1').to route_to("api/users#destroy",id: '1')
  end
end