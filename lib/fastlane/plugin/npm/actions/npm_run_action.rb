require 'fastlane/action'
require_relative '../helper/npm_helper'

module Fastlane
  module Actions
    class NpmRunAction < Action
      def self.run(params)
        command = ['npm', 'run', params[:script]]
        command = ['npm', params[:script]] if ['install', 'test'].include? params[:script]

        command.concat params[:arguments]

        FastlaneCore::CommandExecutor.execute(command: command.join(' '),
                                        print_command: FastlaneCore::Globals.verbose?,
                                            print_all: true)
      end

      def self.description
        "A very simple plugin to run npm scripts"
      end

      def self.authors
        ["Erick Martins"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        "A very simple plugin to run npm scripts"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :script,
                               description: "Script to run",
                                  optional: false,
                                      type: String),
          
          FastlaneCore::ConfigItem.new(key: :arguments,
                             default_value: [],
                               description: "Script arguments",
                                  optional: true,
                                      type: Array),

          FastlaneCore::ConfigItem.new(key: :step_name,
                               description: "Name for this step",
                                  optional: true,
                                      type: String),
        ]
      end

      def self.is_supported?(platform)
        # Adjust this if your plugin only works for a particular platform (iOS vs. Android, for example)
        # See: https://docs.fastlane.tools/advanced/#control-configuration-by-lane-and-by-platform
        #
        # [:ios, :mac, :android].include?(platform)
        true
      end
    end
  end
end
