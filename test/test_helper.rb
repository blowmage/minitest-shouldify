require "minitest/autorun"
require "minitest/matchers"
require "minitest/shouldify"

class Foo
  def bar
    "bar"
  end
  def baz
    "baz"
  end
end


module MiniTest
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

class MiniTest::Unit::TestCase
  include MiniTest::Shouldify::Matchers
end
