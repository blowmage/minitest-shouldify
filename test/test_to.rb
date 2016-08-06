require "helper"

Minitest::Shouldify.register! "to", "not_to"

describe Foo do
  let(:foo) { Foo.new }

  describe "asserts" do
    describe :bar do
      it "is bar" do
        assert_equal "bar", foo.bar
      end
      it "isn't baz" do
        refute_equal "baz", foo.bar
      end
    end

    describe :baz do
      it "is baz" do
        assert_equal "baz", foo.baz
      end
      it "isn't baz" do
        refute_equal "bar", foo.baz
      end
    end
  end

  describe "default matcher" do
    describe :bar do
      it "is bar" do
        foo.bar.must_equal "bar"
        value(foo.bar).must_equal "bar"
      end
      it "isn't baz" do
        foo.bar.wont_equal "baz"
        value(foo.bar).wont_equal "baz"
      end
    end

    describe :baz do
      it "is baz" do
        foo.baz.must_equal "baz"
        value(foo.baz).must_equal "baz"
      end
      it "isn't baz" do
        foo.baz.wont_equal "bar"
        value(foo.baz).wont_equal "bar"
      end
    end
  end

  describe "new matcher" do
    describe :bar do
      it "is bar" do
        foo.bar.to_equal "bar"
        value(foo.bar).to_equal "bar"
      end
      it "isn't baz" do
        foo.bar.not_to_equal "baz"
        value(foo.bar).not_to_equal "baz"
      end
    end

    describe :baz do
      it "is baz" do
        foo.baz.to_equal "baz"
        value(foo.baz).to_equal "baz"
      end
      it "isn't baz" do
        foo.baz.not_to_equal "bar"
        value(foo.baz).not_to_equal "bar"
      end
    end
  end

  describe "be_equal_to matcher" do
    describe :bar do
      it "is bar" do
        foo.bar.to_be_equal_to "bar"
        value(foo.bar).to_be_equal_to "bar"
      end
      it "isn't baz" do
        foo.bar.not_to_be_equal_to "baz"
        value(foo.bar).not_to_be_equal_to "baz"
      end
    end

    describe :baz do
      it "is baz" do
        foo.baz.to_be_equal_to "baz"
        value(foo.baz).to_be_equal_to "baz"
      end
      it "isn't baz" do
        foo.baz.not_to_be_equal_to "bar"
        value(foo.baz).not_to_be_equal_to "bar"
      end
    end

    describe "with subject" do
      subject { foo.bar }

      it { to     be_equal_to("bar") }
      it { not_to be_equal_to("baz") }

      to     { be_equal_to("bar") }
      not_to { be_equal_to("baz") }
    end
  end

end
