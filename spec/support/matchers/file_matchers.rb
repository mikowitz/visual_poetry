RSpec::Matchers.define(:be_the_same_file_as) do |expected_file_name|
  match do |actual_file_name|
    @actual_file_name = actual_file_name
    expect(md5_hash(@actual_file_name)).to eq md5_hash(expected_file_name)
  end

  failure_message_for_should do
    "Expected #{md5_hash(@actual_file_name)} to == #{md5_hash(expected_file_name)}"
  end

  def md5_hash(file_name)
    Digest::MD5.hexdigest(File.read(file_name))
  end
end
