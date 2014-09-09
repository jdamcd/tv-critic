export GEM_HOME=vendor/bundle

build:
        gem install bundler --bindir bin/
        bin/bundle install --deployment --binstubs

clean:
        git clean -x -d -f