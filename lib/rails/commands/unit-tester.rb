require 'rails/commands/test_environment'

module Rails
  module Commands
    class UnitTester < Tester
      def test(what = nil)
        case what
        when NilClass
          print_test_usage
        when "all"
          run "test/**/**/*_test.rb"
        when /^[^\/]+$/ # models
          run "test/#{what}/**/*_test.rb"
        when /[\/]+/ # models/person
          run "test/#{what}_test.rb"
        end

        "Completed"
      end


      private
        def trigger_runner
          if defined?(Test::Unit::TestCase) && ActiveSupport::TestCase.ancestors.include?(Test::Unit::TestCase)
            MiniTest::Unit.runner.run
          else
            # MiniTest::Spec setups in Rails 4.0+ has autorun defined
          end
        end

    end
  end
end

