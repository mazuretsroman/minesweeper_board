require 'rails_helper'

RSpec.describe Board, type: :model do
  describe 'factory' do
    let(:board) { build(:board) }

    it { expect(board).to be_valid }
  end

  describe 'validations' do
    describe 'email' do
      context 'when invalid' do
        let(:board) { build(:board, email: '123') }

        it { expect(board).to be_invalid }
      end

      context 'when absent' do
        let(:board) { build(:board, email: '') }

        it { expect(board).to be_invalid }
      end
    end

    describe 'name' do
      context 'when too short' do
        let(:board) { build(:board, name: 'a') }

        it { expect(board).to be_invalid }
      end

      context 'when too long' do
        let(:board) { build(:board, name: 'a' * 51) }

        it { expect(board).to be_invalid }
      end
    end

    describe 'matrix' do
      context 'when absent' do
        let(:board) { build(:board, matrix: []) }

        it { expect(board).to be_invalid }
      end
    end
  end
end
