# # spec/controllers/reservations_controller_spec.rb

# require 'rails_helper'

# describe ReservationsController do
#   let(:motorcycle) { create(:motorcycle) }
#   let(:user) { create(:user) }
#   let(:reservation) { create(:reservation, motorcycle: motorcycle, user: user) }

#   it 'new' do
#     get :new
#     expect(response).to have_http_status(:success)
#     expect(response).to render_template('new')
#   end

#   it 'create' do
#     post :create, params: { reservation: { start_date: '2022-01-01', end_date: '2022-01-31', motorcycle_id: motorcycle.id, user_id: user.id } }
#     expect(response).to have_http_status(:redirect)
#     expect(Reservation.last).to have_attributes(start_date: '2022-01-01', end_date: '2022-01-31', motorcycle_id: motorcycle.id, user_id: user.id)
#   end

#   it 'edit' do
#     get :edit, params: { id: reservation.id }
#     expect(response).to have_http_status(:success)
#     expect(response).to render_template('edit')
#   end

#   it 'update' do
#     put :update, params: { id: reservation.id, reservation: { start_date: '2022-01-01', end_date: '2022-01-31', motorcycle_id: motorcycle.id, user_id: user.id } }
#     expect(response).to have_http_status(:redirect)
#     expect(Reservation.find(reservation.id)).to have_attributes(start_date: '2022-01-01', end_date: '2022-01-31', motorcycle_id: motorcycle.id, user_id: user.id)
#   end

#   it 'destroy' do
#     delete :destroy, params: { id: reservation.id }
#     expect(response).to have_http_status(:redirect)
#     expect(Reservation.find_by(id: reservation.id)).to be_nil
#   end
# end
