require "minitest/autorun"
require "minitest/matchers"
require "minitest/shouldify"
require "minitest/rg"

class Foo
  def bar
    "bar"
  end
  def baz
    "baz"
  end
end

module Minitest
  module Shouldify
    module Matchers
      class BeEqualTo
        def initialize expected
          @expected = expected
        end

        def matches? actual
          @actual = actual
          @actual == @expected
        end

        def failure_message
          "Expected #{@actual.inspect} " +
          "to be the same as #{@expected.inspect}"
        end

        def negative_failure_message
          "Expected #{@actual.inspect} " +
          "to not be the same as #{@expected.inspect}"
        end
      end

      def be_equal_to(attr)
        BeEqualTo.new(attr)
      end

      def self.included(base)
        instance_methods.each do |name|
          base.register_matcher name, name
        end
      end
    end
  end
end

class Minitest::Test
  include Minitest::Shouldify::Matchers
end
