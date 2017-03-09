Assuming ruby is installed on your system, run `gem install bundler` and then
run `bundle install` this will install dependencies.

Run `ruby main.rb` to find the answer to the questions posed.

You can run tests the the word tour and word knight by run `rspec specs/`

In the word tour document I've included a heuristic to prevent exploring
non-fruitful paths but since it doesn't change the big O time complexity (only
the average  time complexity) I left implementing it as a future exercise.
