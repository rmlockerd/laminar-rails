# frozen_string_literal: true

# Generator for new particles.
class Laminar::ParticleGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('templates', __dir__)

  def generate
    template "#{self.class.generator_name}.erb",
             File.join('app/flows', class_path, "#{file_name}.rb")

    template 'spec.erb',
             File.join('spec/flows', class_path, "#{file_name}_spec.rb")
  end
end
