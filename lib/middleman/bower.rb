require "middleman/bower/version"

module Middleman
  module Bower
    # Default location where bower stashes its assets.
    DEFAULT_ASSETS_PATH = './components'

    class << self
      # Register bower assets into the middleman sprockets asset manifest.
      def registered(app, options_hash={}, &block)
        # The .bowerrc file should be present in the application root.
        bowerrc_path = File.join(app.root, '.bowerrc')

        # Try to parse out the directory of bower assets if the user
        # has specified so in the ./.bowerrc file.
        bower_directory = if File.exists? bowerrc_path
          JSON.parse(File.read(bowerrc_path))['directory']
        end

        # Set the absolute asset path to the one we detected in the .bowerrc file or 
        # the default bower assets path.
        bower_assets_path = File.join(app.root, bower_directory || DEFAULT_ASSETS_PATH)

        # We have to wait for Sprockets to be initialized by Middleman
        # before we can add the bower assets path to the Sprockets path, so
        # lets set that up in the after_configuration callback.
        app.after_configuration do
          sprockets.append_path bower_assets_path
        end
      end
      alias :included :registered
    end

    ::Middleman::Extensions.register(:bower, Middleman::Bower)
  end
end
