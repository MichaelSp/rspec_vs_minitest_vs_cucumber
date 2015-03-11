
require 'cucumber/cli/main'

buffer = StringIO.new
configuration = Cucumber::Cli::Configuration.new(buffer, STDERR)
configuration.parse!(['--format','pretty','--strict','features'])
Cucumber.logger = configuration.log

runtime = Cucumber::Runtime.new(configuration)
runtime.run!
runtime.write_stepdefs_json
