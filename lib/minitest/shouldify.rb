require "minitest/spec"

module MiniTest::Shouldify # :nodoc:
  class << self
    attr_accessor :run_setup # :nodoc:
    attr_accessor :expectation_owners # :nodoc:
    attr_accessor :expectation_names # :nodoc:

    ##
    # Registers new expectations names.
    #
    # Example:
    #
    #   MiniTest::Shouldify.register! "should", "should_not"
    #
    #   describe Foo do
    #     it "is bar" do
    #       Foo.new.bar.should_be_equal_to "bar"
    #     end
    #   end
    def register! new_must, new_wont # :nodoc:
      self.expectation_names ||= []
      self.expectation_names << [new_must, new_wont]
      self.expectation_names.uniq!
      # Run shouldify setup immediately
      self.shouldify! true
    end

    ##
    # Main method for shouldifying expectations
    # (and matchers)
    def shouldify! force = nil # :nodoc:
      # Don't run this more than needed
      if force || self.run_setup
        self.expectation_names ||= []
        self.expectation_names.each do |new_must, new_wont|
          shouldify_expectations new_must, new_wont
          shouldify_matchers     new_must, new_wont

          self.run_setup = false
        end
      end
    end

    ##
    # Register a class that has expectation methods
    # so we can alias the methods afterwards
    def added_expectation! owner # :nodoc:
      self.expectation_owners ||= []
      self.expectation_owners << owner
      self.expectation_owners.uniq!
      # Flush the cache
      self.run_setup = true
    end

    def shouldify_matchers new_must, new_wont # :nodoc:
      # Only do this if Matchers exists
      if MiniTest.const_defined?("Matchers")
        unless MiniTest::Shouldify.const_defined?("Matcher_#{new_must}_#{new_wont}")
          m = Module.new
          m.module_eval "
            def #{new_must}(*args, &block)
              must(*args, &block)
            end
            def #{new_wont}(*args, &block)
              wont(*args, &block)
            end
          "
          MiniTest::Shouldify.const_set("Matcher_#{new_must}_#{new_wont}", m)

          MiniTest::Spec.send :include, m
          MiniTest::Spec.extend m
        end
      end
    end

    def shouldify_expectations new_must, new_wont # :nodoc:
      self.expectation_owners ||= []
      self.expectation_owners.each do |klass|
        shouldify_klass klass, new_must, new_wont
      end
    end

    def shouldify_klass klass, new_must, new_wont # :nodoc:
      shouldify_klass_methods klass, /^must_/, "#{new_must}_"
      shouldify_klass_methods klass, /^wont_/, "#{new_wont}_"
    end

    def shouldify_klass_methods klass, orig_regex, new_prefix # :nodoc:
      klass.instance_eval do
        public_instance_methods.grep(orig_regex).each do |method|
          new_method = method.to_s.sub(orig_regex, new_prefix).to_sym
          alias_method new_method, method
        end
      end
    end
  end
end
# Prime the existing expectation owner
# MiniTest adds all expectations to Object by default
MiniTest::Shouldify.added_expectation! Object

# Add hook to infect_an_assertion
class Module # :nodoc:
  alias :infect_an_assertion_shouldified :infect_an_assertion
  def infect_an_assertion meth, new_name, dont_flip = false # :nodoc:
    # Call the original method
    infect_an_assertion_shouldified meth, new_name, dont_flip
    # Register the class that has the expectation
    MiniTest::Shouldify.added_expectation! self
  end
end

module MiniTest
  module Shouldify
    module Lifecycle # :nodoc:
      # Hook into Minitest's Lifecycle to alias methods when tests are run.
      def before_setup # :nodoc:
        MiniTest::Shouldify.shouldify!
        super
      end
    end
  end
  class Unit # :nodoc:
    class TestCase # :nodoc:
      # Register the Lifecycle
      include MiniTest::Shouldify::Lifecycle
    end
  end

  ##
  # Registers new expectations names.
  #
  # Example:
  #
  #   MiniTest.shouldify! "should", "should_not"
  #
  #   class Foo
  #     def bar; "bar"; end
  #   end
  #
  #   describe Foo, :bar do
  #     it "is bar" do
  #       Foo.new.bar.should_equal "bar"
  #     end
  #
  #     it "is not baz" do
  #       Foo.new.bar.should_not_equal "baz"
  #     end
  #   end
  def self.shouldify! new_must, new_wont
    MiniTest::Shouldify.register! new_must, new_wont
  end
end
