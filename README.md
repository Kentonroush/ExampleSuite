## Example Test Suite
This is an example of how to use Cucumber and Selenium to automate testing of a web application, using the publically accessible test site at https://the-internet.herokuapp.com as the test subject.

### Test Execution
Executing these tests on a machine requires minimal setup, beyond the installation of firefox and ruby 3.0.2. (Any Ruby 3 version should work, but development was under 3.0.2) Executing the following commands in the base directory the project was installed in should run all tests without any additional setup required:

```gem install bundler```

```bundle install```

```bundle exec cucumber features/test_features```

### Todo
This project is a 'complete' working demonstration of some basic principles of test automation, but if I have time to work on it more there are a few particular features which would be a high priority to add. In particular, the two main features that need to be added are:

- Expanded test reporting, using a rake task to generate a human-readable output file after execution instead of relying on command line outputs.
- Parallel test execution support- Larger test suites take prohibitively long to run if all tests are executed in sequence, so solutions exist using the parallel_cucumber gem and, for more advanced uses, Selenium Grid.

Beyond these, simply adding more test coverage to demonstrate how to handle more of the advanced examples on the test site is the main priority. 