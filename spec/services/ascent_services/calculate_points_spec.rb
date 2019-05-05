# frozen_string_literal: true

require 'rails_helper'

describe AscentServices::CalculatePoints do
  describe '.call' do
    let(:ascent) do
      create(:ascent, climbing_route: climbing_route, ascent_style: ascent_style)
    end
    let(:climbing_route) { create(:climbing_route, route_grade: route_grade) }
    let(:route_grade) { create(:route_grade, grade: '7c', points: 800) }
    let(:ascent_style) { create(:ascent_style, :os) }

    subject { described_class.call(ascent: ascent) }

    it 'returns correct sum of points for style and grade' do
      expect(subject).to eq(950)
    end
  end
end
