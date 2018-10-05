# frozen_string_literal: true

require 'generators/common_generator'

module Laminar
  # Generator for new Flows
  class FlowGenerator < CommonGenerator
    argument :particles, type: :array, default: [], banner: 'particle1 particle2 ...'
  end
end
