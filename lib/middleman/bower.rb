require "middleman/bower/version"

module Middleman
  module Bower
    class << self
      # Register bower assets into the middleman sprockets asset manifest.
      def registered(app, options_hash={}, &block)
        # The .bowerrc file should be present in the application root.
        bowerrc_path = File.join(app.root, '.bowerrc')

        # Try to parse out the directory of bower assets if the user
        # has specified so in the ./.bowerrc file.
        bower_assets_path = if File.exists? bowerrc_path
          JSON.parse(File.read(bowerrc_path))['directory']
        end

        # Assume the default bower asset location if the .bowerrc
        # file wasn't detected in the root path.
        bower_assets_path ||= File.join(app.root, 'components')

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
