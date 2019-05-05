# frozen_string_literal: true

require 'rails_helper'

describe AscentStyle, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:ascents) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:style) }
    it { is_expected.to validate_length_of(:style) }
    it { is_expected.to validate_numericality_of(:points).
        only_integer.
        is_less_than_or_equal_to(150).
        is_greater_than_or_equal_to(0)
      }
  end
end
