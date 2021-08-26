require 'fastlane_core/ui/ui'

module Fastlane
  UI = FastlaneCore::UI unless Fastlane.const_defined?("UI")

  module Helper
    class NpmHelper
      def self.find_root_dir(dir = Dir.pwd)
        return dir if File.file?(File.join(dir, 'package.json'))
    
        parent_dir = File.expand_path("..", dir)
        return nil unless parent_dir != '/'
      
        find_root_dir parent_dir
      end

      def self.update_file_content(file_name:, search:, replace:)
        text = File.read(file_name)
        new_contents = text.gsub(search, replace)

        # To write changes to the file, use:
        File.open(file_name, "w") {|file| file.puts new_contents }
      end 
    end
  end
end
