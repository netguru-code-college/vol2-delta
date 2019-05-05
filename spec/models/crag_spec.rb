# frozen_string_literal: true

require 'rails_helper'

describe Crag, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:sectors) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:country) }
    it { is_expected.to validate_presence_of(:longitude) }
    it { is_expected.to validate_presence_of(:latitude) }
  end
end
