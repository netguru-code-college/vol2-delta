require 'rails_helper'

describe ClimbingRoutesController, type: :request do
  let(:user) { create(:user) }
  let(:crag) { create(:crag) }
  let(:sector) { create(:sector, crag: crag) }

  describe 'GET #index' do
    before { login_as(user) }

    subject { get '/climbing_routes' }

    it 'responds with success status 200' do
      subject
      expect(response).to have_http_status(200)
    end
  end

  shared_examples 'is unauthorized' do
    it 'redirects to the sign in page' do
      subject
      expect(response.status).to eq(302)
      expect(response.body).to match(/You are being.+sign_in.+redirected/)
    end
  end

  describe 'POST #create' do
    let(:route_grade) { create(:route_grade) }
    let(:params) do
      {
        climbing_route:
          {
            name: 'Mantra Mandala',
            route_grade_id: route_grade.id,
            sector_id: sector.id
          }
      }
    end
    let(:endpoint) do
      "/crags/#{crag.id}/sectors/#{sector.id}/climbing_routes"
    end

    subject { post endpoint, params: params }

    context 'when user is logged in' do
      before { login_as(user) }

      context 'with valid params' do
        it 'redirects to climbing route after adding the route' do
          subject
          expect(response).to have_http_status(302)
          expect(response.body).to match(/You are being.+climbing_routes.+redirected/)
        end


        it 'creates new climbing route' do
          expect{ subject }.to change{ ClimbingRoute.count }.from(0).to(1)
        end
      end

      context 'when params are not valid' do
        let(:params) { { climbing_route: { name: nil } } }

        it 'renders new template' do
          subject
          expect(response).to render_template(:new)
        end

        it 'does not update ascent' do
          expect{ subject }.
            not_to change{ ClimbingRoute.count }
        end
      end
    end

    context 'when user is unauthorized' do
      it_behaves_like 'is unauthorized'
    end
  end

  describe 'PATH #update' do
    let!(:climbing_route) { create(:climbing_route, sector: sector, name: 'No name') }
    let(:name) { 'Bushido' }
    let(:params) { { climbing_route: { name: name } } }
    let(:endpoint) do
      "/crags/#{crag.id}/sectors/#{sector.id}/climbing_routes/#{climbing_route.id}"
    end

    subject { patch endpoint, params: params }

    context 'when user is logged in' do
      before { login_as(user) }

      context 'with valid params' do
        it 'redirects to climbing route after updating the route' do
          subject
          expect(response).to have_http_status(302)
          expect(response.body).to match(/You are being.+climbing_routes\/#{climbing_route.id}.+redirected/)
        end

        it 'updates route with a new name' do
          expect{ subject }.
            to change{ climbing_route.reload.name }.
            from('No name').
            to(name)
        end
      end

      context 'when params are not valid' do
        let(:params) { { climbing_route: { name: nil } } }

        it 'renders edit template' do
          subject
          expect(response).to render_template(:edit)
        end

        it 'does not update climbing route' do
          expect{ subject }.
            not_to change{ climbing_route.reload.name }
        end
      end
    end

    context 'when user is unauthorized' do
      it_behaves_like 'is unauthorized'
    end
  end

  describe 'DELETE #destroy' do
    let!(:climbing_route) { create(:climbing_route, sector: sector) }
    let(:endpoint) do
      "/crags/#{crag.id}/sectors/#{sector.id}/climbing_routes/#{climbing_route.id}"
    end

    subject { delete endpoint }

    context 'when user is logged in' do
      before { login_as(user) }

      it 'redirects to sector after adding the route' do
        subject
        expect(response).to have_http_status(302)
        expect(response.body).to match(/You are being.+sectors.+climbing_routes.+redirected/)
      end

      it 'can delete his ascent' do
        expect{ subject }.
          to change{ ClimbingRoute.count }.
          from(1).
          to(0)
      end
    end

    context 'when user is unauthorized' do
      it_behaves_like 'is unauthorized'
    end
  end
end
