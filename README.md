# sinatra-template

## install

```
$ bundle install
```

## tree

```
.
├── Gemfile
├── Gemfile.lock
├── README.md
├── Rakefile
├── app.rb
├── assets
│   └── sass
│       ├── bourbon
│       ├── modules
│       └── styles.sass
├── config.ru
├── public
│   ├── styles.css
│   └── styles.css.map
└── views
    ├── app.slim
    └── home.slim
```

## run

development

```
$ rackup -p 8888
```

production

```
$ RACK_ENV=production rackup -p 8888
```

access to http://localhost:8888

## assets

assets:compile

```
$ rake assets:compile
```

## sass

sass:compile

```
$ rake sass:compile
```

sass:watch

```
$ rake sass:watch
```
