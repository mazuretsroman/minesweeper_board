require 'rails_helper'

RSpec.describe BoardsController, type: :request do
  describe '#create' do
    context 'when valid params' do
      let(:params) { { board: attributes_for(:board_form, :valid) } }

      it { expect { post '/boards', params: }.to change(Board, :count).by(1) }
    end

    context 'when invalid params' do
      let(:params) { { board: attributes_for(:board_form, :invalid) } }

      it { expect { post '/boards', params: }.to_not change(Board, :count) }
    end
  end
end
