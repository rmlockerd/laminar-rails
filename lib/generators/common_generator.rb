# frozen_string_literal: true

# Generator for new particles.
class CommonGenerator < Rails::Generators::NamedBase
  class_option :spec, type: :boolean, default: true

  def generate
    self.class.source_root(File.expand_path('templates', __dir__))

    template "#{self.class.generator_name}.erb",
             File.join('app/flows', class_path, "#{file_name}.rb")

    return unless options[:spec]

    template 'spec.erb',
             File.join('spec/flows', class_path, "#{file_name}_spec.rb")
  end
end
