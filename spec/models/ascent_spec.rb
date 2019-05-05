# frozen_string_literal: true

require 'rails_helper'

describe Ascent, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:climbing_route) }
    it { is_expected.to belong_to(:ascent_style) }
  end

  describe 'validations' do
    it { is_expected.to validate_length_of(:comment).is_at_most(500) }
    it { is_expected.to validate_presence_of(:date) }
  end
end
