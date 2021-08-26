require 'fastlane/action'
require_relative '../helper/npm_helper'

module Fastlane
  module Actions
    class NpmTestAction < Action
      def self.run(params)
        arguments = []
        arguments = ['--coverage'] if params[:coverage]
        arguments.concat params[:arguments]

        other_action.npm_run(
          script: 'test', 
          step_name: params[:step_name],
          arguments: params[:arguments]

        )
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
                             default_value: 'test',
                               description: "Test script",
                                  optional: true,
                                      type: String),
          
          FastlaneCore::ConfigItem.new(key: :arguments,
                              default_value: [],
                                description: "Script arguments",
                                  optional: true,
                                      type: Array),

          FastlaneCore::ConfigItem.new(key: :coverage,
                              default_value: false,
                                description: "With coverage",
                                  optional: true,
                                      type: Boolean),

          FastlaneCore::ConfigItem.new(key: :step_name,
                             default_value: "Running tests",
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
