require_relative "network_tester/version"

module NetworkTester
	module_function

  def notifier(time)
    time = Float(time)
    if time < 10
      notify('wee')
    elsif time > 70
      notify(Integer(time), rate=Integer(time)*2)
    end
  rescue => e
    notify("error",500)
    puts "\n\n#{e} when trying notifier(#{time.inspect})"
    puts e.backtrace
  end

  def pingr(addr='google.com')
    result = `ping -c 1 -t 1 #{addr}`
    timerow = nil
    result.split("\n").detect do |r|
      if r.match /time/
        print "\n#{r}  "
        timerow = r.match /cmp_seq.*time=([^ ]*)/
      end
    end

    if timerow.nil?
      puts result.inspect
      nil
    else
      timerow[1] 
    end
  end
 
  def loop(max_count=nil, addr='google.com')
    count = 1
    while (max_count.nil? or count<max_count)
      time = pingr
      print time.inspect
      notifier(time)
      sleep 1
    end
  rescue => e
    puts 'error, probably not a float'
    puts e
    puts e.backtrace
    notify 'pinger error'
  end

  def notify(msg='da', rate=600)
    if `uname -s`.chomp=='Darwin'
      `say #{msg.inspect} -r #{[rate,400].max}`
    else
      puts "\a", "*********"*10, msg.inspect
    end
  end
end
