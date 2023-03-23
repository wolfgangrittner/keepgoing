# frozen_string_literal: true

module ::Guard
  # Guard plugin for keepgoing, which will `load` the file it is given as an option,
  # on start and on modification.
  class Keepgoing < Plugin
    attr_reader :runs

    def initialize(options = {})
      opts = options.dup
      @runs = 0
      super(opts) # important to call + avoid passing options Guard doesn't understand
    end

    def start
      @runs = 1
      puts "Hi! I'll keepgoing until you press Ctrl+C. Just edit and save away, you can do this 🎉\n\n"
      setup_interrupt_handler
      run_all
    end

    def run_all
      do_run
    end

    def run_on_modifications(_paths)
      puts "Press Ctrl+C to quit keepgoing. Just edit and save away, you can do this 🎉\n\n" if clear_screen_on_reload?
      do_run
    end

    private

    def do_run
      kill_running

      @runs += 1
      fork_and_load
    rescue ScriptError, StandardError => e
      # prevent any script errors from stopping guard/keepgoing, but print error
      puts e.inspect
    end

    def kill_running
      return unless @pid

      Process.kill("HUP", @pid)
    rescue Errno::ESRCH, RangeError
      # process was probably already gone, ignore
    ensure
      @pid = nil
    end

    def fork_and_load
      @pid = fork do
        Signal.trap("HUP") { exit }
        load "./#{options[:file]}", true
      end
      # detach script execution to give control back to guard
      Process.detach(@pid)
    end

    def setup_interrupt_handler
      Signal.trap("INT") do
        kill_running
        exit
      end
    end

    def clear_screen_on_reload?
      @options[:clear_screen_on_reload] || false
    end
  end
end
