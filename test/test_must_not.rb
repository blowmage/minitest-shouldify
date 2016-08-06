require "helper"

Minitest::Shouldify.register! "must", "must_not"

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
      end
      it "isn't baz" do
        foo.bar.wont_equal "baz"
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
        foo.bar.must_equal "bar"
        value(foo.bar).must_equal "bar"
      end
      it "isn't baz" do
        foo.bar.must_not_equal "baz"
        value(foo.bar).must_not_equal "baz"
      end
    end

    describe :baz do
      it "is baz" do
        foo.baz.must_equal "baz"
        value(foo.baz).must_equal "baz"
      end
      it "isn't baz" do
        foo.baz.must_not_equal "bar"
        value(foo.baz).must_not_equal "bar"
      end
    end
  end

  describe "be_equal_to matcher" do
    describe :bar do
      it "is bar" do
        foo.bar.must_be_equal_to "bar"
        value(foo.bar).must_be_equal_to "bar"
      end
      it "isn't baz" do
        foo.bar.must_not_be_equal_to "baz"
        value(foo.bar).must_not_be_equal_to "baz"
      end
    end

    describe :baz do
      it "is baz" do
        foo.baz.must_be_equal_to "baz"
        value(foo.baz).must_be_equal_to "baz"
      end
      it "isn't baz" do
        foo.baz.must_not_be_equal_to "bar"
        value(foo.baz).must_not_be_equal_to "bar"
      end
    end

    describe "with subject" do
      subject { foo.bar }

      it { must     be_equal_to("bar") }
      it { must_not be_equal_to("baz") }

      must     { be_equal_to("bar") }
      must_not { be_equal_to("baz") }
    end
  end

end
