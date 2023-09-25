# spec/controllers/motorcycles_controller_spec.rb

require 'rails_helper'

describe MotorcyclesController do
  let(:motorcycle) { create(:motorcycle) }

  it 'index' do
    get :index
    expect(response).to have_http_status(:success)
    expect(response).to render_template('index')
  end

  it 'show' do
    get :show, params: { id: motorcycle.id }
    expect(response).to have_http_status(:success)
    expect(response).to render_template('show')
  end

  it 'create' do
    post :create, params: { motorcycle: { name: 'My Motorcycle', photo: 'my_motorcycle.jpg', description: 'My Motorcycle Description', model: 'My Motorcycle Model' } }
    expect(response).to have_http_status(:redirect)
    expect(Motorcycle.last).to have_attributes(name: 'My Motorcycle', photo: 'my_motorcycle.jpg', description: 'My Motorcycle Description', model: 'My Motorcycle Model')
  end

  it 'edit' do
    get :edit, params: { id: motorcycle.id }
    expect(response).to have_http_status(:success)
    expect(response).to render_template('edit')
  end

  it 'update' do
    put :update, params: { id: motorcycle.id, motorcycle: { name: 'Updated Motorcycle', photo: 'updated_motorcycle.jpg', description: 'Updated Motorcycle Description', model: 'Updated Motorcycle Model' } }
    expect(response).to have_http_status(:redirect)
    expect(Motorcycle.find(motorcycle.id)).to have_attributes(name: 'Updated Motorcycle', photo: 'updated_motorcycle.jpg', description: 'Updated Motorcycle Description', model: 'Updated Motorcycle Model')
  end

  it 'destroy' do
    delete :destroy, params: { id: motorcycle.id }
    expect(response).to have_http_status(:redirect)
    expect(Motorcycle.find_by(id: motorcycle.id)).to be_nil
  end
end
