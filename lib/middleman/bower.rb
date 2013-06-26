require "middleman/bower/version"
require "sprockets/bower"

module Middleman
  module Bower
    class << self
      # Register bower assets into the middleman sprockets asset manifest.
      def registered(app, options_hash={}, &block)
        # Create a bower manifest that we'll use to configure sprockets.
        bower = ::Sprockets::Bower::Manifest.load(File.join(app.root, '.bowerrc'))
        # We have to wait for Sprockets to be initialized by Middleman
        # before we can add the bower assets path to the Sprockets path, so
        # lets set that up in the after_configuration callback.
        app.after_configuration do
          bower.configure sprockets
        end
      end
      alias :included :registered
    end

    ::Middleman::Extensions.register(:bower, Middleman::Bower)
  end
end
