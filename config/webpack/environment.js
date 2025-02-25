// config/webpack/environment.js
const { environment } = require('@rails/webpacker')

// Bootstrap Icons のフォントファイルを扱えるように設定
environment.loaders.append('fonts', {
  test: /\.(eot|svg|ttf|woff|woff2)$/,
  use: {
    loader: 'file-loader',
    options: {
      name: '[name].[ext]',
      outputPath: 'fonts/'
    }
  }
})

module.exports = environment