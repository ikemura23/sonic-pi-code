# Supernatural Lofi remix - NewJeans: https://youtu.be/ZncbtRo7RXs?si=AzgD5LaEnEkjQBEd

# Output
#   X(Twitter) : https://twitter.com/ikemura23/status/1837523894691049688
#   Instagram : https://www.instagram.com/reel/DAL3sYKS_Fb
#   YouTube : https://youtu.be/Ijh_YhzESwc

use_bpm 40

live_loop :met do
  sleep 0.5
end

live_loop :kick, sync: :met do
  stop
  
  sample :bd_tek, amp: 1, lpf: 110
  sleep 0.5
end

live_loop :loop_amen, sync: :met do
  sample :loop_amen, beat_stretch: 2
  sleep 2
end

live_loop :hat, sync: :met do
  stop
  sleep 0.5
  sample :hat_bdu
  sleep 0.5
end

live_loop :first_synth, sync: :met do
  stop
  use_synth :pulse
  use_synth_defaults release: 0.1, amp: 0.5
  
  with_fx :reverb, mix: 0.7, room: 0.7 do
    
    key = :bb5
    play key
    sleep 0.25
    play key-2
    sleep 0.25
    play key-2
    sleep 0.25
    play key
    sleep 0.25
    
    play key
    sleep 0.125
    play key-2
    sleep 0.25
    play key-2
    sleep 0.125
    play key
    sleep 0.125
    play key-2
    sleep 0.125
    play key-2
    sleep 0.25
  end
end


live_loop :chord_synth, sync: :met do
  ##| stop
  
  use_synth :sine #:tri :sine :organ_tonewheel
  
  use_synth_defaults release: 2
  
  with_fx :reverb, mix: 0.7, room: 0.7 do
    with_fx :hpf, cutoff: 60 do
      play_times chord(:eb3, :m7)
      sleep 2
      
      play_times chord(:eb3, :m7)
      sleep 2
      
      play_times chord(:f3, :m7)
      sleep 2
      
      use_synth_defaults release: 1.25
      
      play_times chord(:bb3, :M, invert: -1)
      sleep 0.75
      
      play_times chord(:bb3, :M, invert: 0)
      sleep 1.25
      
      # ----
      
      use_synth_defaults release: 2
      
      play_times chord(:eb3, :m7)
      sleep 2
      
      play_times chord(:ab3, '6')
      sleep 2
      
      play_times chord(:db3, :M7)
      sleep 2
      
      play_times chord(:db3, :M7)
      sleep 2
    end
  end
end

define :play_times do |chord|
  in_thread do
    play_pattern_timed chord, 0.03, amp: 0.7
  end
end

live_loop :bass, sync: :met do
  ##| stop
  use_synth_defaults release: 0, sustain: 0.25
  use_synth :fm
  
  keys = [
    :eb2,:eb2, :f2, :bb2,
    :eb2,:ab2, :db2, :db2,
  ]
  
  8.times do
    key = keys.tick
    play key
    sleep 0.25
    
    sleep 0.5
    
    play key
    sleep 0.25
    
    sleep 1
  end
end