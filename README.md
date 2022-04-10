# Smartpension Ruby Developer Test

Ruby script created according to the requirements described in `SP Test - Ruby.pdf` file.

# App Requirements
```
ruby >= 2.6.6
```

# Running the script

Go to `ruby_app` directory and run: `./parser.rb LOGFILENAME.log` where `LOGFILENAME.log` is a name of log file to parse.

# Running the tests

- copy content of `.rspec.sample` to `.rspec`, or simply `cp .rspec.sample .rspec`
- `bundle install`
- run the test suite: `rspec`
