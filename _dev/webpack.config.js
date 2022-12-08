/**
 * 2007-2020 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Open Software License (OSL 3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/OSL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to http://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2020 PrestaShop SA
 * @license   https://opensource.org/licenses/OSL-3.0 Open Software License (OSL 3.0)
 * International Registered Trademark & Property of PrestaShop SA
 */

const webpack = require('webpack');
const path = require('path');
const autoprefixer = require('autoprefixer');
const TerserPlugin = require('terser-webpack-plugin');
const MiniCssExtractPlugin = require("mini-css-extract-plugin");
const OptimizeCSSAssetsPlugin = require("optimize-css-assets-webpack-plugin");

module.exports = (env, argv) => {
    const IS_DEV = argv.mode === "development";
    const IS_PROD = argv.mode === "production";
    const _entry = [
        './js/theme.js',
        './css/theme.scss'
    ];
    const _entrySass = [
        './css/theme.scss'
    ];
    const ONLY_SASS = argv.onlysass === true;


    return {
        devtool: IS_DEV ? 'cheap-eval-source-map' : '',
        entry: {
            theme: ONLY_SASS ? _entrySass : _entry
        },
        output: {
            path: path.resolve(__dirname, '../assets/js'),
            filename: '[name].js'
        },
        module: {
            rules: [
                {
                    test: /\.js$/,
                    // exclude: /(node_modules|bower_components)/,
                    include: [
                        path.join(__dirname, '')
                    ],
                  use: {
                    loader: 'babel-loader'
                  }
                },
                {
                    test: /\.s[ac]ss/,
                    use: [
                        {loader: MiniCssExtractPlugin.loader},
                        {
                            loader: 'css-loader',
                            options: {
                                sourceMap: IS_DEV,
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
                    exclude: /(im(a)?g(e)?)(s\b|\b)/,
                    loader: 'file-loader',
                    options: {
                        name: '../fonts/[name].[ext]'
                    }
                },
                {
                    test: /\.(png|jpe?g|gif|svg|webp)$/,
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
          minimize: true,
          minimizer: [
                new TerserPlugin({
                    parallel: true,
                    test: /\.js($|\?)/i,
                    sourceMap: IS_DEV,
                    terserOptions: {
                        compress: {
                            booleans: IS_PROD,
                            conditionals: IS_PROD,
                            drop_console: IS_PROD,
                            drop_debugger: IS_PROD,
                            if_return: IS_PROD,
                            join_vars: IS_PROD,
                            keep_classnames: IS_DEV,
                            keep_fnames: IS_DEV,
                            reduce_vars: IS_PROD,
                            sequences: IS_PROD,
                            warnings: IS_DEV,
                          ecma: 5,

                        },
                        output: {
                            comments: IS_DEV
                        }
                    }
                }),
                new OptimizeCSSAssetsPlugin({
                    cssProcessorOptions: {
                        map: {
                            annotation: true,
                            inline: IS_DEV
                        }
                    }
               }),
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
