# frozen_string_literal: true

require 'rails_helper'

describe ClimbingRoute, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:route_grade) }
    it { is_expected.to belong_to(:sector) }
    it { is_expected.to have_many(:ascents) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_least(3).is_at_most(30) }
  end
end
