require 'helio/version'

module Helio
  class << self
    def load!
      register_compass_extension if compass?

      if rails?
        register_rails_engine
      elsif sprockets?
        register_sprockets
      end

      configure_sass
    end

    def gem_path
      @gem_path ||= File.expand_path '..', File.dirname(__FILE__)
    end

    def stylesheets_path
      File.join assets_path, 'stylesheets'
    end

    def assets_path
      @assets_path ||= File.join gem_path, 'assets'
    end

    def sprockets?
      defined?(::Sprockets)
    end

    def compass?
      defined?(::Compass::Frameworks)
    end

    def rails?
      defined?(::Rails)
    end

    private

    def configure_sass
      require 'sass'

      ::Sass.load_paths << stylesheets_path
      ::Sass::Script::Number.precision = [8, ::Sass::Script::Number.precision].max
    end

    def register_compass_extension
      ::Compass::Frameworks.register(
          'helio',
          :version               => Helio::VERSION,
          :path                  => gem_path,
          :stylesheets_directory => stylesheets_path,
          :templates_directory   => File.join(gem_path, 'templates')
      )
    end

    def register_rails_engine
      require 'helio/engine'
    end

    def register_sprockets
      Sprockets.append_path(stylesheets_path)
    end
  end
end

Helio.load!
