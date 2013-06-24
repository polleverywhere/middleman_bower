# Middleman::Bower

Use [bower](http://bower.io/) to manage [front-end assets and dependencies](http://sindresorhus.com/bower-components/) with [Middleman](http://middlemanapp.com/).

## Installation

Add this line to your application's Gemfile:

    gem 'middleman-bower'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install middleman-bower

Don't forget to [install npm](http://nodejs.org/) and [bower](http://bower.io/).

## Usage

Open the `config.rb` file in Middleman and add the directive:

    activate :bower

Now use bower to install front-end dependencies with your project:

    bower install jquery

And include the asset from your sprockets file:

    //= reqiure jquery/jquery


## Best Practices

Its probably a good idea to keep your bower assets stashed away in the directory `vendor/assets/bower` via the `.bowerrc` file from your project root:

```json
{
  "directory": "vendor/assets/bower",
}
```

The run:

`bower install`

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
