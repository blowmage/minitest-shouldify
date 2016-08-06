require "minitest/autorun"
require "minitest-shouldify"

class TestSanity < Minitest::Test
  def test_sanity
    assert Minitest::Shouldify::VERSION
  end
end
