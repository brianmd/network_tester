require_relative "network_tester/version"

module NetworkTester
	module_function

  def loop(max_count=nil, addr='google.com', maxtime=70)
    count = 1
    while (max_count.nil? or count<max_count)
      time = pingr
      if time.nil?
        puts "' '*50}error"
      else
        time = Integer(Float(time))
        puts "#{'*'*(Integer(time/5))} #{time}"
      end
      notifier(time, maxtime)
      sleep 1
    end
  end

  def pingr(addr='google.com')
    result = `ping -c 1 -t 1 #{addr} 2>/dev/null`
    timerow = nil
    result.split("\n").detect do |r|
      if r.match(/time/)
        timerow = r.match(/cmp_seq.*time=([^ ]*)/)
      end
    end

    if timerow.nil?
      nil
    else
      timerow[1] 
    end
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
    if `uname -s`.chomp=='Darwin'
      `say #{msg.inspect} -r #{[rate,400].max}`
    else
      puts "\a", "*********"*10, msg.inspect
    end
    msg
  end
end
