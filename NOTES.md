

Instead of doing sudo when doing `bundle install`, it may be better to do:

```
bundle install --path vendor/bundle
```

Problems with nokogiri on a Mac?  Try:

```
env ARCHFLAGS='-arch x86_64' bundle install --path vendor/bundle
```