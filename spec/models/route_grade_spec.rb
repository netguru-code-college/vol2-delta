# frozen_string_literal: true

require 'rails_helper'

describe RouteGrade, type: :model do
  describe 'associations' do
    it { is_expected.to have_one(:climbing_route) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:grade) }
    it { is_expected.to validate_length_of(:grade).is_at_least(2).is_at_most(3) }
    it { is_expected.to validate_numericality_of(:points).
        only_integer.
        is_less_than_or_equal_to(1250).
        is_greater_than(100)
      }
  end
end
