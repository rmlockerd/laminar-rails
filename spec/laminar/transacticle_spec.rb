module Laminar
  RSpec.describe Transacticle do
    before do
      create_test_app
    end

    describe '#call_with_txn' do
      it 'runs the particle' do
      end

      context 'when a particle completes normally' do
      end

      context 'when a particle fails' do
        it 'rolls back' do
        end
      end

      context 'when a particle halts' do
      end

      context 'when a particle raises an error' do
      end
    end

    describe '#call!' do
    end
  end
end
