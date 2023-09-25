require 'rails_helper'

RSpec.describe Api::V1::MotorcyclesController, type: :controller do
before do
    @user = create(:user)
  @motorcycle_attributes = {
  make: "Honda",
  name: "CBR600",
  model: "2023"
}

@motorcycle = Motorcycle.create(@motorcycle_attributes, user: @user)

sign_in @user

end

  describe "GET #index" do
it "returns all motorcycles" do
get :index
expect(response).to have_http_status(200)
motorcycles = JSON.parse(response.body)
expect(motorcycles.length).to eq 1
expect(motorcycles.first['name']).to eq @motorcycle.name
end
end

describe "GET #show" do
it "returns the motorcycle" do
get :show, params: {id: @motorcycle.id}
expect(response).to have_http_status(200)
motorcycle = JSON.parse(response.body)
expect(motorcycle['name']).to eq @motorcycle.name
end
end

describe "POST #create" do
it "creates a new motorcycle" do
post :create, params: {
motorcycle: {
make: "Yamaha",
name: "R1",
model: "2024"
}
}

expect(response).to have_http_status(201)
  motorcycle = Motorcycle.last
  expect(motorcycle.make).to eq "Yamaha"
  expect(motorcycle.name).to eq "R1"
end

end

describe "DELETE #destroy" do
it "deletes the motorcycle" do
delete :destroy, params: {id: @motorcycle.id}
expect(response).to have_http_status(200)
expect(Motorcycle.exists?(@motorcycle.id)).to be false
end
end

end
