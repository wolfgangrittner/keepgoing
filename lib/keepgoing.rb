# frozen_string_literal: true

require_relative "keepgoing/version"

require "guard"
require "guard/commander" # needed because of https://github.com/guard/guard/issues/793
require_relative "guard/keepgoing"

# keepgoing's core, that keeps things going
module Keepgoing
  # The .start method will start up Guard using .guardfile as configuration.
  # This mehtod is idempotent, it will start guard only once on the first call.
  # If guard is already active, it will do nothing.
  def self.start
    return if Guard.state

    Guard::UI.level = :warn
    Guard.start(guardfile_contents: guardfile)

    exit
  end

  # @private
  def self.script_file
    $PROGRAM_NAME
  end

  # @private
  def self.guardfile
    <<~GUARDFILE
      clearing :#{clear_screen_on_reload? ? "on" : "off"}
      interactor :off
      guard "keepgoing", file: "#{script_file}", clear_screen_on_reload: #{clear_screen_on_reload?} do
        watch("#{script_file}")
      end
    GUARDFILE
  end

  def self.clear_screen_on_reload?
    %w[1 on true].include?(ENV["CLEAR"])
  end
end

# Automatically start keepgoing
Keepgoing.start
