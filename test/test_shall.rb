require "helper"

Minitest::Shouldify.register! "shall", "shant"

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
        foo.bar.shall_equal "bar"
        value(foo.bar).shall_equal "bar"
      end
      it "isn't baz" do
        foo.bar.shant_equal "baz"
        value(foo.bar).shant_equal "baz"
      end
    end

    describe :baz do
      it "is baz" do
        foo.baz.shall_equal "baz"
        value(foo.baz).shall_equal "baz"
      end
      it "isn't baz" do
        foo.baz.shant_equal "bar"
        value(foo.baz).shant_equal "bar"
      end
    end
  end

  describe "be_equal_to matcher" do
    describe :bar do
      it "is bar" do
        foo.bar.shall_be_equal_to "bar"
        value(foo.bar).shall_be_equal_to "bar"
      end
      it "isn't baz" do
        foo.bar.shant_be_equal_to "baz"
        value(foo.bar).shant_be_equal_to "baz"
      end
    end

    describe :baz do
      it "is baz" do
        foo.baz.shall_be_equal_to "baz"
        value(foo.baz).shall_be_equal_to "baz"
      end
      it "isn't baz" do
        foo.baz.shant_be_equal_to "bar"
        value(foo.baz).shant_be_equal_to "bar"
      end
    end

    describe "with subject" do
      subject { foo.bar }

      it { shall be_equal_to("bar") }
      it { shant be_equal_to("baz") }

      shall { be_equal_to("bar") }
      shant { be_equal_to("baz") }
    end
  end

end
