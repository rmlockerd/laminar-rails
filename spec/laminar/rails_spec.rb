module Laminar
  RSpec.describe Rails, type: :aruba do
    before do
      create_test_app
    end

    def self.test_file_creation(type, name)
      it 'creates a class file and spec' do
        run_simple "bundle exec rails generate laminar:#{type} #{name}"
        path = "app/flows/#{name}.rb"
        expect(path).to be_an_existing_file
        expect(path).to have_file_content(/class #{name.camelize}/)
        expect(path).to have_file_content(/include Laminar::#{type.camelize}/)

        if type == 'particle'
          expect(path).to have_file_content(/def call/)
        else
          expect(path).to_not have_file_content(/def call/)
          expect(path).to have_file_content(/flow do/)
        end

        path = "spec/flows/#{name}_spec.rb"
        expect(path).to be_an_existing_file
        expect(path).to have_file_content(
          /RSpec.describe #{name.camelize}, type: :#{type}/
        )
      end
    end

    it 'has a version number' do
      expect(Laminar::Rails::VERSION).not_to be nil
    end

    context 'when generating a particle' do
      it 'requires a name' do
        run_simple 'bundle exec rails generate laminar:particle'
        expect(last_command_started.stdout).to include('rails generate laminar:particle NAME')
      end

      context 'with just a class' do
        test_file_creation('particle', 'extract_tooth')
      end

      context 'with a module' do
        test_file_creation('particle', 'dentist/extract_tooth')
      end
    end

    context 'when generating a flow' do
      it 'requires a name' do
        run_simple 'bundle exec rails generate laminar:flow'
        expect(last_command_started.stdout).to include('rails generate laminar:flow NAME')
      end

      context 'with just a class' do
        test_file_creation('flow', 'extract_tooth')
      end

      context 'with a module' do
        test_file_creation('flow', 'dentist/extract_tooth')
      end

      it 'takes a list of particles' do
        run_simple 'bundle exec rails generate laminar:flow fill_cavity '\
          'numb_mouth, drill_tooth, fill_tooth'
        path = "app/flows/fill_cavity.rb"
        expect(path).to have_file_content(/flow do/)
        expect(path).to have_file_content(/step :numb_mouth/)
        expect(path).to have_file_content(/step :drill_tooth/)
        expect(path).to have_file_content(/step :fill_tooth/)
      end
    end
  end
end
