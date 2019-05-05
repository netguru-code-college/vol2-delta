# frozen_string_literal: true

require 'rails_helper'

describe User, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:ascents) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_length_of(:first_name).is_at_least(2).is_at_most(15) }
    it { is_expected.to validate_length_of(:last_name).is_at_least(2).is_at_most(15) }
  end

  describe 'scopes' do
    context 'top ten' do
      let!(:users) do
        create_list(:user, 15)
      end
      let!(:best_user) { create(:user, total_points: 12000) }
      let!(:worst_user) { create(:user, total_points: 0) }

      it 'returns only top 10 users' do
        expect(User.top_ten.count).to eq(10)
      end

      it 'includes best user in ranking' do
        expect(User.top_ten).to include(best_user)
      end

      it 'does not include the worst user in the ranking' do
        expect(User.top_ten).not_to include(worst_user)
      end
    end
  end
end
