use_bpm 60

live_loop :met do
  sleep 0.5
end

# drum #############################

live_loop :kick, sync: :met do
  ##| stop
  use_sample_defaults amp: 1.4, lpf: 90
  
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
  ##| stop
  use_sample_defaults hpf: 100, amp: 0.4, rate: 1.3
  
  with_fx :reverb, mix: 0.2 do
    sample :hat_star
    sleep 0.125
  end
end

live_loop :cymbal_open, sync: :met do
  ##| stop
  
  use_sample_defaults amp: 0.5
  sleep 0.25
  sample :hat_cats, rate: 1, lpf: 130
  ##| sample :drum_cymbal_open, amp: 0.1, beat_stretch: 1.8, finish: 0.125, hpf: 90#, rate: 1.1
  sleep 0.25
end


live_loop :snare_loop, sync: :met do
  stop
  
  co = 100
  at = 0.00
  r=3.3
  a = 0.3
  
  with_fx :reverb, mix: 0.2 do
    
    sleep 0.5
    
    sample :sn_generic, rate: r+1, cutoff: co, attack: at, amp: a
    sample :sn_generic, rate: r, start: 0.03, cutoff: co#, pan: 0.2, attack: at
    
    sleep 0.5
  end
end

live_loop :clap, sync: :met do
  ##| stop
  
  use_synth :sc808_clap
  use_synth_defaults amp: 2
  
  with_fx :reverb, mix: 0.3 do
    play :a1
    sleep 0.25
    play :a1
    sleep 0.25
    sleep 0.125
    play :a1
    sleep 0.25
    play :a1
    sleep 0.375
    play :a1
    sleep 0.375
    play :a1
    sleep 0.375
  end
end

live_loop :splash, sync: :met do
  sample :drum_splash_hard, amp: 0.4
  sleep 16
end

### Percussion

live_loop :tabla, sync: :met do
  ##| stop
  use_sample_defaults hpf: 70, amp: 0.8, rate: 1.3
  
  sleep 0.125*3
  sample :tabla_ghe1, rate: 0.8
  sleep 0.125*3
  
  sample :tabla_te_ne
  sleep 0.125
  sample :tabla_te_ne
  sleep 0.125
  
end

live_loop :loop_tabla, sync: :met do
  ##| stop
  sample :loop_safari,  beat_stretch: 8, amp: 2
  sleep 8
end


### Voice

live_loop :sample_voice, sync: :met do
  stop
  use_sample_defaults amp: 0.6#, rate: -1
  
  with_fx :reverb do
    with_fx :hpf, cutoff: 80 do
      sleep 0.75
      ##| with_fx :echo, phase: 0.5, decay: 4 do
      sample :loop_weirdo, start: 0.14, finish: 0.22
      sleep 1.25
      ##| end
    end
  end
end


# Synth ############################

live_loop :synth1, sync: :met do
  stop
  
  use_synth_defaults amp: 0.8, release: 4, sustain: 0
  use_synth :dsaw
  
  with_fx :slicer, phase: 0.5, invert_wave: 1, mix: 0.3 do
    with_fx :reverb, mix: 0.7, room: 0.8 do
      
      with_fx :lpf, cutoff: 100 do
        
        play chord(:eb3, :M7, invert: 0)
        sleep 4
        play chord(:f3, :m7, invert: 0)
        sleep 4
      end
    end
  end
end

live_loop :synth2, sync: :met do
  stop
  use_synth :hollow
  use_synth_defaults amp: 3, release: 0, sustain: 4
  
  with_fx :hpf, cutoff: 100 , mix: 0.7 do
    play chord(:eb3, :M7, invert: 0)
    sleep 4
    play chord(:f3, :m7, invert: 0)
    sleep 4
  end
  
end


# bass ###########################

live_loop :bass, sync: :met do
  ##| stop
  use_synth_defaults amp: 1.3, release: 0.2, sustain: 0.1
  use_synth :dpulse
  
  key = :f1
  
  with_fx :lpf, cutoff: 75 do
    play key
    sleep 0.375
    play key+12
    sleep 0.375
    play key+7
    sleep 0.375
    play key+10
    sleep 0.375
    play key+5
    sleep 2-0.375*4
    
  end
  
end