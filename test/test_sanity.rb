require "minitest/autorun"
require "minitest-shouldify"

class TestSanity < MiniTest::Unit::TestCase
  def test_sanity
    assert Minitest::Shouldify::VERSION
  end
end
