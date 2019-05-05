# frozen_string_literal: true

require 'rails_helper'

describe AscentServices::CalculateUserTotalPoints do
  describe '.call' do
    let!(:user) { create(:user, total_points: 9000) }
    let!(:ascent) { create(:ascent, user: user, points: 700) }

    subject { described_class.call(ascent: ascent) }

    it 'saves new ascent points to user total points' do
      expect(subject).to eq(true)
    end

    it 'updates user total_points' do
      expect{ subject }.to change{ user.reload.total_points }.from(9000).to(9700)
    end
  end
end
