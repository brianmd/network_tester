require "shellwords"
require_relative "network_tester/version"

module NetworkTester
	module_function

  def loop(max_count=nil, addr='google.com', maxtime=70)
    count = 1
    while (max_count.nil? or count<max_count)
      time = pingr(addr)
      if time.nil?
        puts "#{' '*50}error"
      else
        time = Integer(Float(time))
        puts "#{'*'*(Integer(time/5))} #{time}"
      end
      notifier(time, maxtime)
      sleep 1
    end
  rescue Interrupt
  end

  def pingr(addr='google.com')
    timeout_arg = mac? ? '-t' : '-W'
    cmd = "ping -c 1 #{timeout_arg} 1 #{Shellwords.shellescape(addr)}"
    result = `#{cmd} 2>/dev/null`
    match = result.match(/time=([^\s]+)/)
    match&.[](1)
  end

  def notifier(time, maxtime=70)
    if time.nil?
      return notify('error')
    end

    time = Float(time)
    if time < 10
      notify('wee')
    elsif time > maxtime
      notify(Integer(time), Integer(time)*2)
    end
    time
  end

  def notify(msg='da', rate=600)
    if mac?
      system("say", msg.to_s, "-r", [rate, 400].max.to_s)
    else
      puts "\a#{' '*20}#{'-'*10} too long: #{msg.inspect}"
    end
    msg
  end

  def mac?
    `uname -s`.chomp=='Darwin'
  end
end
