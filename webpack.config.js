const path = require('path');
const ManifestPlugin = require('webpack-manifest-plugin');
const VueLoaderPlugin = require('vue-loader/lib/plugin');
const StylelintPlugin = require('stylelint-webpack-plugin');

module.exports = {
  entry: {
    main: './src/index.js',
  },
  output: {
    path: path.join(__dirname, './public/dist'),
    filename: '[name]-[hash].js',
    publicPath:
      process.env.NODE_ENV === 'production' ? '' : 'http://localhost:4000/',
  },
  resolve: {
    extensions: ['.js', '.vue', '.scss'],
    alias: {
      vue$: 'vue/dist/vue.esm.js',
      '@': path.resolve(__dirname, 'src'),
    },
  },
  module: {
    rules: [
      {
        test: /\.vue$/,
        exclude: /node_modules/,
        loader: 'vue-loader',
      },
      {
        test: /\.js$/,
        exclude: /node_modules/,
        loader: 'babel-loader',
      },
      {
        test: /\.css$/,
        use: ['vue-style-loader', 'css-loader'],
      },
      {
        test: /\.scss$/,
        use: ['vue-style-loader', 'css-loader', 'sass-loader'],
      },
    ],
  },
  plugins: [
    new ManifestPlugin(),
    new VueLoaderPlugin(),
    new StylelintPlugin({
      files: ['src/**/*.vue', 'src/**/*.scss', 'src/**/*.css'],
    }),
  ],
  devServer: {
    contentBase: '../public/dist',
    port: 4000,
    disableHostCheck: true,
    host: '0.0.0.0',
  },
};
