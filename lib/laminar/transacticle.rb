# frozen_string_literal: true

require 'active_record'

module Laminar
  # Extends Laminar::Particle to include methods to wrap calls in
  # ActiveRecord transactions.
  module Transacticle

    def self.included(klass)
      klass.class_eval do
        include Laminar::Particle
        extend ClassMethods
      end
    end

    # Laminar::Particle class methods and attributes.
    module ClassMethods
      def call_with_txn(context = {})
        self.call_with_txn!(context)
      rescue ParticleStopped
        context
      end

      def call_with_txn!(context = {})
        ActiveRecord::Base.transaction do
          self.call!(context)
        end
      end
    end
  end
end
