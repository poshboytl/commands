module Rails
  module Commands
    class Tester
      def test(what = nil)
        "Completed"
      end


      private
        def run(*test_patterns)
          TestEnvironment.fork do
            test_patterns.each do |test_pattern|
              Dir[test_pattern].each do |path|
                require File.expand_path(path)
              end
            end

            trigger_runner
          end
        end

        def trigger_runner
          # should be implemented in subclass
        end

        def print_test_usage
          puts <<-EOT
    Usage:
      test "WHAT"

    Description:
        Runs either a full set of test suites or single suite.

        If you supply WHAT with either models, controllers, helpers, integration, or performance,
        those whole sets will be run.

        If you supply WHAT with models/person, just test/models/person_test.rb will be run.
    EOT
        end
    end
  end
end
