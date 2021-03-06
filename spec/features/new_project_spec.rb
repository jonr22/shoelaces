require 'spec_helper'

feature 'Shoelaces a new project with default configuration' do
  scenario 'specs pass' do
    run_shoelaces

    Dir.chdir(project_path) do
      Bundler.with_clean_env do
        expect(`rake`).to include('0 failures')
      end
    end
  end

  scenario 'staging config is inherited from production' do
    run_shoelaces

    staging_file = IO.read("#{project_path}/config/environments/staging.rb")
    config_stub = "Rails.application.configure do"

    expect(staging_file).to match(/^require_relative "production"/)
    expect(staging_file).to match(/#{config_stub}/), staging_file
  end

  scenario 'generated .ruby-version is pulled from Shoelaces .ruby-version' do
    run_shoelaces

    ruby_version_file = IO.read("#{project_path}/.ruby-version")

    expect(ruby_version_file).to eq "#{RUBY_VERSION}\n"
  end

  scenario 'secrets.yml reads secret from env' do
    run_shoelaces

    secrets_file = IO.read("#{project_path}/config/secrets.yml")

    expect(secrets_file).to match(/secret_key_base: <%= ENV\["SECRET_KEY_BASE"\] %>/)
  end

  scenario 'action mailer support file is added' do
    run_shoelaces

    expect(File).to exist("#{project_path}/spec/support/action_mailer.rb")
  end

  scenario 'newrelic.yml reads NewRelic license from env' do
    run_shoelaces

    newrelic_file = IO.read("#{project_path}/config/newrelic.yml")

    expect(newrelic_file).to match(
      /license_key: "<%= ENV\["NEW_RELIC_LICENSE_KEY"\] %>"/
    )
  end

  scenario 'records pageviews through Segment.io if ENV variable set' do
    run_shoelaces

    expect(analytics_partial).
      to include(%{<% if ENV["SEGMENT_IO_KEY"] %>})
    expect(analytics_partial).
      to include(%{window.analytics.load("<%= ENV["SEGMENT_IO_KEY"] %>");})
  end

  scenario "raises on missing translations in development/test" do
    run_shoelaces

    %w(test development).each do |environment|
      environment_file = IO.read("#{project_path}/config/environments/#{environment}.rb")
      expect(environment_file).to match /^ +config.action_view.raise_on_missing_translations = true$/
    end
  end

  def analytics_partial
    IO.read("#{project_path}/app/views/application/_analytics.html.erb")
  end
end
