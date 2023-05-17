require 'rails_helper'

RSpec.describe BoardMatrix::Presenter do
  let(:board) { build(:board, matrix: [[true, false, false], [false, false, true]]) }

  describe '.to_s' do
    subject { described_class.new(board:).to_s }

    let(:expected_result) { "true false false\nfalse false true" }

    it { is_expected.to eq(expected_result) }
  end
end
