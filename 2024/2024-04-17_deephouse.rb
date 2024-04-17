# Deep House
# Inspire : Monolithic - 3am (resonance) https://music.youtube.com/watch?v=oquTMigqJAE&si=ymG7AWfh5yPOR_O4
# Back movie: https://www.youtube.com/watch?v=B6Dhz9GUTwY
# Output : https://twitter.com/ikemura23/status/1780523091900440658

clap = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_claps"

live_loop :met do
  sleep 0.5
end

with_fx :distortion, amp: 1 do
  
  live_loop :kick, sync: :met do
    stop
    
    sample :bd_fat, # :bd_tek :bd_808 bd_fat
      amp: 1, lpf: 110
    sleep 0.5
  end
  
  
  live_loop :hat, sync: :met do
    stop
    use_sample_defaults cutoff: 100, amp: 1.2
    
    3.times do
      sleep 0.25
      sample :hat_raw
      sleep 0.25
    end
    
    sleep 0.25
    sample :hat_raw
    sleep 0.125
    
    sample :hat_raw
    sleep 0.125
  end
  
  live_loop :hat2, sync: :met do
    ##| stop
    use_sample_defaults cutoff: 100, amp: 0.8
    
    sleep 1
    sample :hat_star
    sleep 1
  end
  
end

live_loop :snare_loop, sync: :met do
  stop
  
  sleep 0.5
  
  sample clap, 3
  
  sleep 0.5
end

live_loop :synth1, sync: :met do
  ##| stop
  use_synth_defaults release: 6, attack: 1, amp: 4
  use_synth :hollow
  with_fx :reverb do
    
    play chord(:bb4, :M7)
    sleep 4
    
    play chord(:bb4, :M7)
    sleep 4
    
    play chord(:f4, :M7)
    sleep 4
    
    play  chord(:f4, :M7)
    sleep 4
    ##| end
  end
end

live_loop :synth2, sync: :met do
  ##| stop
  use_synth_defaults release: 4, attack: 1, amp: 0.7, cutoff: 60
  use_synth :saw #:sine
  with_fx :reverb do
    with_fx :distortion, amp: 1 do
      play chord(:bb3, :M7, invert: -2)
      sleep 4
      
      play chord(:bb3, :M7, invert: -1)
      sleep 4
      
      play chord(:f3, :M7, invert: -2)
      sleep 4
      
      play chord(:f3, :M7, invert: -1)
      sleep 4
    end
  end
end

live_loop :bass1, sync: :met do
  ##| stop
  use_synth_defaults release: 5, amp: 1.5 #1.5
  use_synth :beep
  
  play :bb1
  sleep 4
  
  play :c2
  sleep 4
  
  play :f2
  sleep 4
  
  play [:f2,:d2].tick
  sleep 4
  
end

live_loop :bass2, sync: :met do
  stop
  use_synth_defaults release: 0.15, amp: 1.3, cutoff: 90
  use_synth :dpulse
  
  keys = [:bb1,:c2, :f1, :f1]
  
  4.times do
    key = keys.tick
    4.times do
      sleep 0.125
      play key
      sleep 0.25
      play key
      sleep 0.375
      play key
      sleep 0.25
    end
  end
end
