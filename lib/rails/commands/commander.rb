require 'rails/commands/raker'
require 'rails/commands/tester'
require 'rails/commands/unit_tester'
require 'rails/commands/generator'

module Rails
  module Commands
    class Commander
      delegate :rake, to: :raker
      delegate :test, to: :unit_tester
      delegate :generate, :destroy, :update, to: :generator

      attr_reader :raker, :tester, :generator

      def initialize
        @raker       = Raker.new
        @unit_tester = UnitTester.new
        @generator   = Generator.new
      end
    end
  end
end
