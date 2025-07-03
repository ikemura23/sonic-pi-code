use_bpm 60

live_loop :met do
  sleep 0.5
end

# Drum #############################

live_loop :kick, sync: :met do
  sample :bd_tek, amp: 1, lpf: 110
  sleep 0.5
end

live_loop :hat, sync: :met do
  ##| stop
  sleep 0.25
  sample :hat_zap, lpf: 110
  sleep 0.25
  
end

# Synth #############################

live_loop :synth_1, sync: :met do
  ##| stop
  ##| use_synth_defaults
  ##| use_synth :dsaw
  
  with_fx :reverb do
    
    play :c3
    sleep 1
  end
end

# Bass #############################

live_loop :bass, sync: :met do
  ##| stop
  ##| use_synth_defaults
  use_synth :fm
  
  play :c2
  sleep 1
  
end
