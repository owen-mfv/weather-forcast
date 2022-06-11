require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'vcr_cassettes'
  c.hook_into :faraday
  c.filter_sensitive_data("REDACTED") do |interaction|
    interaction.request.headers["X-RapidAPI-Key"]&.first
  end
end
