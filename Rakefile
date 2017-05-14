task default: %w[]

namespace :sass do
  desc 'sass:compile'
  task :compile do
    sh 'sass ./assets/sass/styles.sass:./public/styles.css --style compressed'
  end

  desc 'sass:watch'
  task :watch do
    sh 'sass --watch ./assets/sass/styles.sass:./public/styles.css --style compressed'
  end
end
