# frozen_string_literal: true

require_relative "lib/keepgoing/version"

Gem::Specification.new do |spec|
  spec.name = "keepgoing"
  spec.version = Keepgoing::VERSION
  spec.authors = ["Wolfgang Rittner"]
  spec.email = ["me@wolfgangrittner.dev"]

  spec.summary = "Supercharge your ruby script with auto-run on save."
  spec.description = <<~DESC
    This gem is intended for use in a single file Ruby script that uses bundler/inline.
    You start your script once with `ruby your-script.rb` and keepgoing will take control,
    and re-run your script every time you save your script.
    You can concentrate on tinkering, while keepgoing will, well keep going,
    providing you with a fast and effortless feedback loop for your ruby experiments.
  DESC
  spec.homepage = "https://github.com/wolfgangrittner/keepgoing"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/wolfgangrittner/keepgoing"
  spec.metadata["changelog_uri"] = "https://github.com/wolfgangrittner/keepgoing/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "guard", "~> 2.18"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
