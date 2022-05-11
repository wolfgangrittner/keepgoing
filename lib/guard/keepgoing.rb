# frozen_string_literal: true

module ::Guard
  # Guard plugin for keepgoing, which will `load` the file it is given as an option,
  # on start and on modification.
  class Keepgoing < Plugin
    attr_reader :runs

    def initialize(options = {})
      puts options
      opts = options.dup
      @runs = 0
      super(opts) # important to call + avoid passing options Guard doesn't understand
    end

    def start
      @runs = 1
      puts "Hi! I'll keepgoing until you press Ctrl+C. Just edit and save away, you can do this 🎉\n\n"
      run_all
    end

    def run_all
      do_run
    end

    def run_on_modifications(_paths)
      puts "Press Ctrl+C to quit keepgoing. Just edit and save away, you can do this 🎉\n\n"
      do_run
    end

    private

    def do_run
      @runs += 1
      load options[:file]
    rescue ScriptError, StandardError => e
      # prevent any script errors from stopping guard/keepgoing, but print error
      puts e.inspect
    end
  end
end
