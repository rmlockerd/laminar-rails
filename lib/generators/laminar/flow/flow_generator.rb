# frozen_string_literal: true

# Generator for new Flows
class Laminar::FlowGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('templates', __dir__)
  argument :particles, type: :array, default: [],
                       banner: 'particle1 particle2 ...'

  def generate
    template "#{self.class.generator_name}.erb",
             File.join('app/flows', class_path, "#{file_name}.rb")

    template 'spec.erb',
             File.join('spec/flows', class_path, "#{file_name}_spec.rb")
  end
end
