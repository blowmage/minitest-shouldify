require "helper"

Minitest::Shouldify.register! "should", "should_not"

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
        foo.bar.should_equal "bar"
        value(foo.bar).should_equal "bar"
      end
      it "isn't baz" do
        foo.bar.should_not_equal "baz"
        value(foo.bar).should_not_equal "baz"
      end
    end

    describe :baz do
      it "is baz" do
        foo.baz.should_equal "baz"
        value(foo.baz).should_equal "baz"
      end
      it "isn't baz" do
        foo.baz.should_not_equal "bar"
        value(foo.baz).should_not_equal "bar"
      end
    end
  end

  describe "be_equal_to matcher" do
    describe :bar do
      it "is bar" do
        foo.bar.should_be_equal_to "bar"
        value(foo.bar).should_be_equal_to "bar"
      end
      it "isn't baz" do
        foo.bar.should_not_be_equal_to "baz"
        value(foo.bar).should_not_be_equal_to "baz"
      end
    end

    describe :baz do
      it "is baz" do
        foo.baz.should_be_equal_to "baz"
        value(foo.baz).should_be_equal_to "baz"
      end
      it "isn't baz" do
        foo.baz.should_not_be_equal_to "bar"
        value(foo.baz).should_not_be_equal_to "bar"
      end
    end

    describe "with subject" do
      subject { foo.bar }

      it { should     be_equal_to("bar") }
      it { should_not be_equal_to("baz") }

      should     { be_equal_to("bar") }
      should_not { be_equal_to("baz") }
    end
  end

end
