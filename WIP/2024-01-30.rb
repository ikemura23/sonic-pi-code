live_loop :met do
  sleep 0.5
end

live_loop :kick, sync: :met do
  use_sample_defaults amp: 1.1, lpf: 90
  sample :bd_tek # :bd_haus :bd_tek :bd_ada
  sleep 0.5
end

live_loop :snare_loop, sync: :met do
  ##| stop
  ##| use_sample_defaults lpf: 100
  
  co = 90
  at = 0.00
  r=3.3
  
  with_fx :reverb, mix: 0.2 do
    
    sleep 0.5
    
    in_thread do
      sample :sn_generic, rate: r+1, cutoff: co, attack: at, amp: 0.1
      sleep 0.01
      sample :sn_generic, rate: r, start: 0.03, cutoff: co#, pan: 0.2, attack: at
    end
    sleep 0.5
  end
end


live_loop :synth1, sync: :met do
  ##| stop
  
  use_synth_defaults release: 2, amp: 1
  
  cd = chord(:ab3, :M7, invert: +2)
  
  with_fx :reverb, mix: 0.9, room: 0.8 do
    ##| with_fx :slicer, phase: 0.5, mix: 0.5, invert_wave: 1, smooth: 0.5 do
    
    with_fx :lpf, cutoff: 90 do
      use_synth :dtri
      play cd, amp: 0.5
      use_synth :sine
      play chord(:ab3, :M7, invert: 1)
      sleep 2
      
      ##| play cd
      sleep 2
      ##| end
    end
  end
end


live_loop :synth2, sync: :met do
  ##| stop
  use_synth :dsaw
  use_synth_defaults release: 0.25, amp: 1, cutoff: 90
  
  with_fx :reverb, mix: 0.5, room: 0.2 do
    with_fx :echo, decay: 6, phase: 0.375, max_phase: 5 do
      with_fx :hpf, cutoff: 80 do
        sleep 1
        play chord(:ab4, :M7, invert: -2)
        sleep 3
      end
      
    end
  end
end

live_loop :bass, sync: :met do
  ##| stop
  use_synth_defaults amp: 1.3, release: 0.2, sustain: 0.1
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