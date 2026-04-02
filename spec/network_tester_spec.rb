require "spec_helper"

describe NetworkTester do
  it "has a version number" do
    expect(NetworkTester::VERSION).not_to be nil
  end

  describe ".pingr" do
    it "extracts time from a successful ping response" do
      ping_output = <<~OUTPUT
        PING google.com (142.250.80.46): 56 data bytes
        64 bytes from 142.250.80.46: icmp_seq=0 ttl=117 time=12.345 ms

        --- google.com ping statistics ---
        1 packets transmitted, 1 packets received, 0.0% packet loss
        round-trip min/avg/max/stddev = 12.345/12.345/12.345/0.000 ms
      OUTPUT

      allow(NetworkTester).to receive(:`).and_return(ping_output)
      expect(NetworkTester.pingr).to eq("12.345")
    end

    it "returns nil when ping times out" do
      ping_output = <<~OUTPUT
        PING google.com (142.250.80.46): 56 data bytes

        --- google.com ping statistics ---
        1 packets transmitted, 0 packets received, 100.0% packet loss
      OUTPUT

      allow(NetworkTester).to receive(:`).and_return(ping_output)
      expect(NetworkTester.pingr).to be_nil
    end

    it "returns nil when ping output is empty" do
      allow(NetworkTester).to receive(:`).and_return("")
      expect(NetworkTester.pingr).to be_nil
    end
  end

  describe ".notifier" do
    before do
      allow(NetworkTester).to receive(:notify)
    end

    it "notifies 'wee' for fast pings under 10ms" do
      NetworkTester.notifier(5, 70)
      expect(NetworkTester).to have_received(:notify).with("wee")
    end

    it "notifies with the time for slow pings over maxtime" do
      NetworkTester.notifier(100, 70)
      expect(NetworkTester).to have_received(:notify).with(100, 200)
    end

    it "does not notify for normal pings between 10ms and maxtime" do
      NetworkTester.notifier(30, 70)
      expect(NetworkTester).not_to have_received(:notify)
    end

    it "notifies 'error' when time is nil" do
      NetworkTester.notifier(nil, 70)
      expect(NetworkTester).to have_received(:notify).with("error")
    end

    it "returns the time as a float" do
      expect(NetworkTester.notifier(30, 70)).to eq(30.0)
    end
  end

  describe ".mac?" do
    it "returns true when uname is Darwin" do
      allow(NetworkTester).to receive(:`).and_return("Darwin\n")
      expect(NetworkTester.mac?).to be true
    end

    it "returns false when uname is Linux" do
      allow(NetworkTester).to receive(:`).and_return("Linux\n")
      expect(NetworkTester.mac?).to be false
    end
  end
end
