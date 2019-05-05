require 'rails_helper'

describe AscentsController, type: :request do
  let(:user) { create(:user) }
  let(:crag) { create(:crag) }
  let(:sector) { create(:sector, crag: crag) }
  let(:climbing_route) { create(:climbing_route, sector: sector) }

  describe 'GET #index' do

    subject { get '/ascents' }

    it 'responds with success status 200' do
      subject
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    let!(:ascent) { create(:ascent, climbing_route: climbing_route) }
    let(:endpoint) do
      "/crags/#{crag.id}/sectors/#{sector.id}/climbing_routes/#{climbing_route.id}/ascents/#{ascent.id}"
    end

    subject { get endpoint }

    it 'responds with success status 200' do
      subject
      expect(response).to have_http_status(200)
      expect(response).to render_template(:show)
      expect(response.body).to include(climbing_route.name)
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
    let(:ascent_style) { create(:ascent_style, :os) }
    let(:params) do
      {
        ascent:
          {
            ascent_style_id: ascent_style.id,
            date: Date.current,
            climbing_route_id: climbing_route.id,
            user_id: user.id,
          }
      }
    end
    let(:endpoint) do
      "/crags/#{crag.id}/sectors/#{sector.id}/climbing_routes/#{climbing_route.id}/ascents"
    end

    subject { post endpoint, params: params }

    context 'when user is logged in' do
      before { login_as(user) }

      context 'with valid params' do
        it 'redirects to user profile after adding ascent' do
          subject
          expect(response).to have_http_status(302)
          expect(response.body).to match(/You are being.+climbing_routes\/#{climbing_route.id}.+redirected/)
        end

        it 'creates new ascent' do
          expect{ subject }.to change{ Ascent.count }.from(0).to(1)
        end
      end

      context 'when params are not valid' do
        let(:params) { { ascent: { climbing_route_id: "#{climbing_route.id}" } } }

        it 'renders new template' do
          subject
          expect(response).to render_template(:new)
        end

        it 'does not update ascent' do
          expect{ subject }.
            not_to change{ Ascent.count }
        end
      end
    end

    context 'when user is unauthorized' do
      it_behaves_like 'is unauthorized'
    end
  end

  describe 'PATH #update' do
    let!(:ascent) { create(:ascent, climbing_route: climbing_route) }
    let(:comment) { 'Very nice route, but runouts are scary' }
    let(:params) { { ascent: { comment: comment } } }
    let(:endpoint) do
      "/crags/#{crag.id}/sectors/#{sector.id}/climbing_routes/#{climbing_route.id}/ascents/#{ascent.id}"
    end

    subject { patch endpoint, params: params }

    context 'when user is logged in' do
      before { login_as(user) }

      context 'with valid params' do
        it 'redirects to climbing route after adding ascent' do
          subject
          expect(response).to have_http_status(302)
          expect(response.body).to match(/You are being.+user\/#{user.id}.+redirected/)
        end

        it 'updates ascent with a new comment' do
          expect{ subject }.
            to change{ ascent.reload.comment }.
            from(nil).
            to(comment)
        end
      end

      context 'when params are not valid' do
        let(:params) { { ascent: { date: nil } } }

        it 'renders edit template' do
          subject
          expect(response).to render_template(:edit)
        end

        it 'does not update ascent' do
          expect{ subject }.
            not_to change{ ascent.reload.date }
        end
      end
    end

    context 'when user is unauthorized' do
      it_behaves_like 'is unauthorized'
    end
  end

  describe 'DELETE #destroy' do
    let!(:ascent) { create(:ascent, climbing_route: climbing_route, user: user) }
    let(:endpoint) do
      "/crags/#{crag.id}/sectors/#{sector.id}/climbing_routes/#{climbing_route.id}/ascents/#{ascent.id}"
    end

    subject { delete endpoint }

    context 'when user is logged in' do
      before { login_as(user) }

      it 'redirects to user profile after adding ascent' do
        subject
        expect(response).to have_http_status(302)
        expect(response.body).to match(/You are being.+user\/#{user.id}.+redirected/)
      end

      it 'can delete his ascent' do
        expect{ subject }.
          to change{ user.ascents.count }.
          from(1).
          to(0)
      end

      context 'when ascent does not belong to user' do
        let(:other_user) { create(:user) }
        let!(:ascent) { create(:ascent, climbing_route: climbing_route, user: other_user) }

        it 'can not delete other user ascent' do
          expect{ subject }.
          not_to change{ Ascent.count }
        end
      end
    end

    context 'when user is unauthorized' do
      it_behaves_like 'is unauthorized'
    end
  end
end
