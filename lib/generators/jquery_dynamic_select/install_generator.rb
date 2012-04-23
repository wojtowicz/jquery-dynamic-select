require 'rails/generators'

module DynamicSelect
  class InstallGenerator < Rails::Generators::Base
    def install
      # Copy the unobtrusive JS file
      copy_file('dynamic-select-rails.js', 'app/assets/javascripts/dynamic-select-rails.js')
    end

    def self.source_root
      File.join(File.dirname(__FILE__), '..', '..', 'assets', 'javascripts')
    end
  end
end