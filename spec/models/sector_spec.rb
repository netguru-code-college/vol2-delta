# frozen_string_literal: true

require 'rails_helper'

describe Sector, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:climbing_routes) }
    it { is_expected.to belong_to(:crag) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:aspect) }
    it { is_expected.to validate_presence_of(:longitude) }
    it { is_expected.to validate_presence_of(:latitude) }
  end
end
