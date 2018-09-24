module Helpers
  def create_test_app
    run_simple <<-BLOCK
      bundle exec rails new test_app \
        --skip-yarn \
        --skip-gemfile \
        --skip-git \
        --skip-keeps \
        --skip-action-mailer \
        --skip-active-record \
        --skip-puma \
        --skip-action-cable \
        --skip-sprockets \
        --skip-spring \
        --skip-listen \
        --skip-coffee \
        --skip-javascript \
        --skip-turbolinks \
        --skip-test-unit \
        --skip-test \
        --skip-system-test \
        --skip-bundle \
        --skip-bootsnap \
        --quiet
      BLOCK
    cd 'test_app'
    write_file 'Gemfile', <<-EOF
      gem "rails"
      gem "laminar-rails", path: "#{GEM_TOP}"
      EOF
    run_simple 'bundle install'
  end
end
