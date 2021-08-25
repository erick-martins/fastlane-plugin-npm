require 'fastlane/action'
require_relative '../helper/npm_helper'

module Fastlane
  module Actions
    class NpmInstallAction < Action
      def self.run(params)
        other_action.sh('rm -rf ../node_modules 2> /dev/null') if params[:clean]
        
        other_action.npm_run(
          script: 'install', 
          step_name: params[:step_name]
        )

        other_action.npm_post_install if params[:post_install_after]
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
          FastlaneCore::ConfigItem.new(key: :step_name,
                             default_value: "Installing dependencies"
                               description: "Name for this step",
                                  optional: true,
                                      type: String),
                                      
          FastlaneCore::ConfigItem.new(key: :post_install_after,
                             default_value: false,
                               description: "Run postinstall script right after",
                                  optional: true,
                                      type: Boolean),

          FastlaneCore::ConfigItem.new(key: :clean,
                             default_value: false,
                               description: "Deletes node_modules folder",
                                  optional: true,
                                      type: Boolean),

          FastlaneCore::ConfigItem.new(key: :post_install_after,
                             default_value: false,
                               description: "Run postinstall script right after",
                                  optional: true,
                                      type: Boolean),
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
