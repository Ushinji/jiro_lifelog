const path = require("path");
const ManifestPlugin = require("webpack-manifest-plugin");
const VueLoaderPlugin = require('vue-loader/lib/plugin')

module.exports = {
  entry: {
    main: "./src/index.js"
  },
  output: {
    path: path.join(__dirname, "./public/dist"),
    filename: "[name]-[hash].js",
    publicPath: `http://localhost:4000/`
  },
  resolve: {
    extensions: ['.js', '.vue'],
    alias: {
      vue$: 'vue/dist/vue.esm.js',
    },
  },
  module: {
    rules: [
      {
        test: /\.vue$/,
        exclude: /node_modules/,
        loader: 'vue-loader'
      },
      {
        test: /\.js$/,
        exclude: /node_modules/,
        loader: 'babel-loader',
      },
    ]
  },
  plugins: [new ManifestPlugin(), new VueLoaderPlugin()],
  devServer: {
    contentBase: "../public/dist",
    port: 4000,
    disableHostCheck: true,
    host: "0.0.0.0"
  }
};
