const { environment } = require('@rails/webpacker')

module.exports = environment

const webpack = require('webpack')
environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery'
  })
)

environment.config.merge({
  module: {
    rules: [
      {
        test: require.resolve('jquery'),
        use: [{
          loader: 'expose-loader',
          options: '$'
        }, {
          loader: 'expose-loader',
          options: 'jQuery'
        }]
      },
      {
        test: require.resolve('rails-ujs'),
        use: [{
          loader: 'expose-loader',
          options: 'Rails'
        }]
      }
    ]
  }
});

module.exports = environment;