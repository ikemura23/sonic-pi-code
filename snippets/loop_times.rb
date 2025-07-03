live_loop :met do
    sleep 1
  end
  
  live_loop :size_times_sample, sync: :met do
    stop
    use_synth :dpulse
    sc = scale(:e3, :blues_minor, num_octaves: 2)
    
    sc.size.times do |i|
      play sc[i], release: 0.5
      sleep 0.25
    end
  end
  
  
  
  live_loop :times_sample, sync: :met do
    ##| stop
    use_synth :dpulse
    sc = scale(:e3, :blues_minor, num_octaves: 2)
    
    4.times do |i|
      play sc[i], release: 2
      sleep 2
    end
  end