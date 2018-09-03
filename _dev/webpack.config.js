const webpack = require('webpack');
const path = require('path');
const autoprefixer = require('autoprefixer');
const UglifyJSPlugin = require('uglifyjs-webpack-plugin');
const MiniCssExtractPlugin = require("mini-css-extract-plugin");
const OptimizeCSSAssetsPlugin = require("optimize-css-assets-webpack-plugin");

module.exports = (env, argv) => {
  const IS_DEV = argv.mode === "development";
  const IS_PROD = argv.mode === "production";

  return {
    devtool: IS_DEV ? 'cheap-eval-source-map' : '',
    entry: {
      theme: [
        './js/theme.js',
        './css/theme.scss'
      ]
    },
    output: {
      path: path.resolve(__dirname, '../assets/js'),
      filename: '[name].js'
    },
    module: {
      rules: [
        {
          test: /\.(js|jsx)$/,
          exclude: /(node_modules|bower_components)/,
          include: [
            path.join(__dirname, '')
          ],
          use: ['babel-loader']
        },
        {
          test: /\.s[ac]ss/,
          use: [
            {loader: MiniCssExtractPlugin.loader},
            {
              loader: 'css-loader',
              options: {
                sourceMap: IS_DEV,
                minimize: IS_PROD
              }
            },
            {
              loader: 'postcss-loader',
              options: {
                sourceMap: IS_DEV,
                plugins: function () {
                  return [autoprefixer]
                }
              }
            },
            {
              loader: 'sass-loader',
              options: {
                sourceMap: IS_DEV
              }
            },
          ]
        },
        {
          test: /.(woff(2)?|eot|ttf|svg)(\?[a-z0-9=.]+)?$/,
          exclude: [/img/],
          loader: 'file-loader',
          options: {
            name: '../fonts/[hash].[ext]'
          }
        },
        {
          test: /\.(png|jpg|gif|svg)$/,
          use: [
            {
              loader: 'file-loader',
              options: {
                name: '../img/[hash].[ext]'
              }
            }
          ]
        },
        {
          test: /\.css$/,
          use: [{
            loader: 'style-loader',
            options: {sourceMap: IS_DEV}
          }, {
            loader: 'css-loader',
            options: {sourceMap: IS_DEV}
          }, {
            loader: 'postcss-loader',
            options: {sourceMap: IS_DEV}
          }]
        }
      ]
    },
    externals: {
      prestashop: 'prestashop',
      $: '$',
      jquery: 'jQuery'
    },
    optimization: {
      minimizer: [
        new UglifyJSPlugin({
          parallel: true,
          test: /\.js($|\?)/i,
          sourceMap: IS_DEV,
          uglifyOptions: {
            compress: {
              sequences: IS_PROD,
              conditionals: IS_PROD,
              booleans: IS_PROD,
              if_return: IS_PROD,
              join_vars: IS_PROD,
              drop_console: IS_PROD,
              keep_classnames: IS_DEV,
              keep_fnames: IS_DEV,
              warnings: IS_DEV
            },
            output: {
              comments: IS_DEV
            },
            minimize: IS_PROD
          }
        }),
        new OptimizeCSSAssetsPlugin({})
      ]
    },
    plugins: [
      new MiniCssExtractPlugin({
        filename: "../css/[name].css",
        chunkFilename: "../css/[id].css"
      }),
      new webpack.ProvidePlugin({
        Popper: ['popper.js', 'default']
      })
    ],
    watchOptions: {
      ignored: /node_modules/
    }
  }
}
