class FakeHeroku
  RECORDER = File.expand_path(File.join('..', '..', 'tmp', 'heroku_commands'), File.dirname(__FILE__))

  def initialize(args)
    @args = args
  end

  def run!
    File.open(RECORDER, 'a') do |file|
      file.puts @args.join(' ')
    end
  end

  def self.clear!
    FileUtils.rm_rf RECORDER
  end

  def self.has_gem_included?(project_path, gem_name)
    gemfile = File.open(File.join(project_path, 'Gemfile'), 'a')

    File.foreach(gemfile).any? do |line|
      line.match(/#{Regexp.quote(gem_name)}/)
    end
  end

  def self.has_created_app_for?(remote_name)
    app_name = "#{ShoelacesTestHelpers::APP_NAME}-#{remote_name}"
    expected_line = "create #{app_name} --remote=#{remote_name}\n"

    File.foreach(RECORDER).any? { |line| line == expected_line }
  end

  def self.has_configured_vars?(remote_name, var)
    File.foreach(RECORDER).any? do |line|
      line =~ /^config:add #{var}=.+ --remote=#{remote_name}\n$/
    end
  end
end
