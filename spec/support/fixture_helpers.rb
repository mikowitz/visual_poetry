module FixtureHelpers
  def fixture_file_path(name)
    File.join(File.dirname(__FILE__), '..', 'fixtures/files/', name)
  end
end
