require 'rails_helper'

RSpec.describe BoardMatrix::Generator do
  subject { described_class.new(width:, height:, mines:).call }

  describe '1x1' do
    let(:width) { 1 }
    let(:height) { 1 }

    context 'when mine is present' do
      let(:mines) { 1 }

      it { is_expected.to eq([[true]]) }
    end

    context 'when no mines' do
      let(:mines) { 0 }

      it { is_expected.to eq([[false]]) }
    end
  end

  describe 'orientation' do
    context 'when width: 2, height: 3' do
      let(:width) { 2 }
      let(:height) { 3 }
      let(:mines) { 0 }
      let(:expected_matrix) do
        [[false, false],
         [false, false],
         [false, false]]
      end

      it { is_expected.to eq(expected_matrix) }
    end

    context 'when width: 3, height: 2' do
      let(:width) { 3 }
      let(:height) { 2 }
      let(:mines) { 0 }
      let(:expected_matrix) do
        [[false, false, false],
         [false, false, false]]
      end

      it { is_expected.to eq(expected_matrix) }
    end
  end

  describe 'mines count' do
    subject do
      described_class
        .new(width:, height:, mines:)
        .call
        .flatten
        .select(&:itself)
        .count
    end

    let(:width) { 5 }
    let(:height) { 3 }

    context 'when zero' do
      let(:mines) { 0 }

      it { is_expected.to eq(0) }
    end

    context 'when more than matrix size' do
      let(:mines) { width * height + 1 }

      it { is_expected.to eq(width * height) }
    end

    context 'when more than zero and less than matrix size' do
      let(:mines) { rand(1...(width * height)) }

      it { is_expected.to eq(mines) }
    end
  end
end
