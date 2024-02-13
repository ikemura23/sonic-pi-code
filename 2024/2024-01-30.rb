# Output: https://twitter.com/ikemura23/status/1748822961614934090
# Background movie: https://kaiber.ai/share/c83aa193-a608-4362-8a66-f694c577a56d

# Deep House

live_loop :met do
  sleep 0.5
end

# drum #############################

live_loop :kick, sync: :met do
  stop
  use_sample_defaults amp: 1.3, lpf: 100
  
  7.times do
    sample :bd_tek
    sleep 0.5
  end
  sample :bd_tek
  sleep 0.25
  sample :bd_tek
  sleep 0.25
end

live_loop :hat, sync: :met do
  stop
  use_sample_defaults hpf: 100, amp: 0.2, rate: 1.3
  
  with_fx :reverb, mix: 0.2 do
    sleep 0.25
    2.times do
      sample :hat_star
      sleep 0.125
    end
    sleep 0.25
    2.times do
      sample :hat_star
      sleep 0.125
    end
    
    4.times do
      sample :hat_star
      sleep 0.125
    end
    sleep 0.25
    
    2.times do
      sample :hat_star
      sleep 0.125
    end
  end
end

live_loop :cymbal_open, sync: :met do
  stop
  
  sleep 0.25
  sample :hat_cats, rate: 1, lpf: 130
  sample :drum_cymbal_open, amp: 0.2, beat_stretch: 1.8, finish: 0.125, hpf: 90#, rate: 1.1
  sleep 0.25
end

live_loop :snare_loop, sync: :met do
  ##| stop
  
  co = 90
  at = 0.00
  r=3.3
  
  with_fx :reverb, mix: 0.2 do
    
    sleep 0.5
    
    sample :sn_generic, rate: r+1, cutoff: co, attack: at, amp: 0.2
    sample :sn_generic, rate: r, start: 0.03, cutoff: co#, pan: 0.2, attack: at
    
    sleep 0.5
  end
end


# Synth ############################

live_loop :synth1, sync: :met do
  ##| stop
  
  use_synth_defaults release: 1.25, amp: 1.2
  
  cd = chord(:ab2, :M7, invert: +2)
  
  with_fx :reverb, mix: 0.8, room: 0.8 do
    
    with_fx :lpf, cutoff: 90 do
      2.times do
        use_synth :dtri
        play cd, amp: 0.5
        use_synth :sine
        play chord(:ab3, :M7, invert: 1)
        sleep 2
        
        sleep 2
      end
    end
  end
end


live_loop :synth2, sync: :met do
  ##| stop
  use_synth :saw
  use_synth_defaults release: 0.25, amp: 1.5, cutoff: 90
  
  with_fx :reverb, mix: 0.5, room: 0.2 do
    with_fx :echo, decay: 6, phase: 0.375, max_phase: 5 do
      with_fx :lpf, cutoff: 100 , mix: 1 do
        sleep 1.25
        play chord(:ab2, :M7, invert: 0)
        sleep 2.75
      end
      
    end
  end
end


# bass ###########################

live_loop :bass, sync: :met do
  ##| stop
  use_synth_defaults amp: 1.5, release: 0.2, sustain: 0.1
  use_synth :fm
  ##| with_fx :lpf, cutoff: 70 do
  key = :f2
  sleep 0.25
  play key
  sleep 0.375
  play key-2
  sleep 0.25
  play key
  sleep 0.25
  sleep 0.25
  
  play key-2
  sleep 0.375
  
  play key
  sleep 1-0.375*2
  with_fx :lpf, cutoff: 85 do
    ##| end
  end
end