# frozen_string_literal: true

module Laminar
  # Base methods for a logic particle. Particles can be invoked
  # by themselves or as part of a Flow. Classes should include
  # this module rather than inherit.
  module Particle
    def self.included(klass)
      klass.class_eval do
        include InstanceMethods
      end
    end

    # Laminar::Particle class methods and attributes.
    module InstanceMethods
      def call_with_txn(context = {})
        ActiveRecord::Base.transaction do
        new(context).invoke
      end

      def call_with_txn!(context = {})
        new(context).invoke!
      end
    end
  end
end
