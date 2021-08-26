require 'fastlane/action'
require_relative '../helper/npm_helper'

module Fastlane
  module Actions
    class UpgradePackageJsonVersionAction < Action
      def self.run(params)
        UI.message "Changing package.json version to #{params[:new_version]}"
        root_dir = Helper::NpmHelper.find_root_dir

        UI.user_error! "apparently it's not running inside a node project. package.json cannot be found" unless root_dir

        package_json_path = File.join(root_dir, 'package.json')

        regex = Regexp.new("\"version\": \"#{params[:version_match]}\"")
        
        Helper::NpmHelper.update_file_content(
          file_name: package_json_path, 
          search: regex, 
          replace: "\"version\": \"#{params[:new_version]}\""
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
          FastlaneCore::ConfigItem.new(key: :new_version,
                             default_value: "Installing dependencies",
                               description: "Name for this step",
                                  optional: true,
                                      type: String),

          FastlaneCore::ConfigItem.new(key: :version_match,
                              default_value: '(\d+\.\d+\.\d+)',
                                description: "Regex to match the version",
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
