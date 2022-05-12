# Keepgoing

https://user-images.githubusercontent.com/467114/168008226-333aeec1-2318-42c1-876b-33096f5010f0.mp4

keepgoing uses [guard](https://github.com/guard/guard) to tighten the feedback loop on your single-file Ruby script that uses [bundler/inline](https://bundler.io/guides/bundler_in_a_single_file_ruby_script.html).  
When added as a gem to your script, it will run your script once when started like you are used to, but it won't exit and rather keep it going and re-run it every time you modify your script. You keep tinkering and once you save your script runs again and you 💥 immediately see the result 🤯.

## bundler/inline
When trying out things with Ruby, and maybe a new Ruby gem or [even full blown Rails](https://christoph.luppri.ch/single-file-rails-applications-for-fun-and-bug-reporting), an awesome way to do this is using "bundler/inline".  
It allows you to put a whole application including a "gemfile" into a single-file Ruby script, which gives you a quick feedback loop and allows you to share the whole thing as one self-contained file.

## automate > manual
It would be great if we could tighten things up even more and supercharge the feedback loop by combining bundler/inline with guard auto-run.  
I was wondering if guard could be inlined into that single-file Ruby script as well, and set up to execute that single file whenever it changed. This would allow us to start things up once, then keep editing and see results immediately.  
Turns out you can, meet keepgoing!


## Usage

Example Ruby single-file script:
```ruby:test.rb
require "bundler/inline"

gemfile do
  source "https://rubygems.org"
  gem "keepgoing"
end

puts "Woohoo"
```

When you run this script in a terminal with `ruby test.rb`, it will execute like it would without keepgoing, printing out "Woohoo".  
But you'll notice it won't exit back to your terminal prompt. If you go back to your editor and change something, say add another `puts` and save, you'll notice it gets executed again and you see the results of your edit right away.

## Development

After checking out the repo, run `bin/setup` to install dependencies.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/wolfgangrittner/keepgoing. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/wolfgangrittner/keepgoing/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Keepgoing project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/wolfgangrittner/keepgoing/blob/main/CODE_OF_CONDUCT.md).
