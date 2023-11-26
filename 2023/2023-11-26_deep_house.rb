use_bpm 62

claps = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_claps"

drum_play = 1
drum_hat_clap = 1
splash_play = 1

synth1_play = 1
synth2_play = 0

bass_play = 1
hollow_play = 0
pico_play = 0

live_loop :met do
  sleep 0.5
end

# Drum --------------------

with_fx :reverb, mix: 0.2 do
  
  live_loop :kick, sync: :met do
    if drum_play < 1 then stop end
    use_sample_defaults amp: 1.1, lpf: 100
    sample :bd_tek # :bd_haus :bd_tek :bd_ada
    sleep 0.5
  end
  
  live_loop :cymbal_open, sync: :met do
    ##| stop
    if drum_hat_clap < 1 then stop end
    use_sample_defaults lpf: 110
    sleep 0.125
    
    with_fx :distortion do
      sample :hat_gem, amp: [0, 0, 0.8, 0].tick
      sleep 0.125
      sample :hat_cats # :hat_psych
      ##| sample :drum_cymbal_open, amp: 0.2, beat_stretch: 1.8, finish: 0.125, hpf: 80
    end
    
    sleep 0.25
  end
end

# clap
live_loop :clap1, sync: :met do
  if drum_hat_clap < 1 then stop end
  
  sleep 0.5
  with_fx :reverb, mix: 0.4 do
    sample claps, 0, amp: 1, lpf: 120, rate: 0.8
  end
  sleep 0.5
end

##| live_loop :snare, sync: :met do
##|   if drum_hat_clap < 1 then stop end
##|   with_fx :reverb, room: 0.6 do
##|     use_sample_defaults  amp: 1, rate: 1, finish: 0.5

##|     sleep 0.5
##|     sleep 0.375
##|     sample :drum_snare_soft
##|     sleep 0.25
##|     sample :drum_snare_soft
##|     sleep 0.25
##|     sample :drum_snare_soft, amp: [0,1].tick
##|     sleep 2-0.5-0.375-0.25*2

##|   end
##| end

# splash
live_loop :splash, sync: :met do
  if splash_play < 1 then stop end
  sample :drum_splash_hard, amp: 0.5
  sleep 16
end


live_loop :misc_cineboom, sync: :met do
  if splash_play < 1 then stop end
  sleep 14
  with_fx :hpf, cutoff: 100 do
    sample :misc_cineboom, beat_stretch: 10, finish: 0.2, amp: 2
  end
  sleep 2
end

# Synth ------------------

live_loop :synth1, sync: :met do
  
  if synth1_play < 1 then stop end
  use_synth :saw
  use_synth_defaults release: 0.15, cutoff: 100, amp: 1.2
  key=:cs4
  i=-3
  
  with_fx :reverb, mix: 0.7, room: 0.5 do
    
    sleep 0.125
    play chord(key, :m7, invert: i)
    sleep 0.25
    play chord(key, :m7, invert: i)
    sleep 0.375
    play chord(key, :m7, invert: i)
    sleep 0.375
    
    play chord(key+5, :m7, invert: i)
    sleep 0.375
    
    play chord(key+3, :m7, invert: i)
    sleep 0.25
    
    
    play chord(key, :m7, invert: i)
    sleep 0.25
    
  end
end


live_loop :synth2, sync: :met do
  
  if synth2_play < 1 then stop end
  use_synth :dsaw # :supersaw :dsaw
  use_synth_defaults release: 0.25, cutoff: 100, amp: 0.8
  
  with_fx :reverb, mix: 0.7, room: 0.5 do
    with_fx :echo, phase: 0.25, mix: 0.25, decay: 1.5 do
      with_fx :wobble, phase: 0.5, invert_wave: 0, mix: 0.0, wave: 0 do
        play chord(:g3, :M7)
        sleep 0.5
        play chord(:g3, :M7)
        sleep 0.5
        
        play chord(:g3+3, :M7)
        sleep 0.5
        play chord(:g3+3, :M7)
        sleep 0.5
        
        play chord(:g3+2, :m7)
        sleep 0.5
        
        play chord(:g3+4, :M7)
        sleep 0.5
        
        sleep 1
      end
    end
    
  end
end


live_loop :pico, sync: :met do
  if pico_play < 1 then stop end
  
  use_synth :pulse
  use_synth_defaults release: 0.2, amp: 0.1, cutoff: 90
  
  cd = [:d5, :d5+12,:d5]
  
  with_fx :reverb do
    with_fx :echo, mix: 0.3, phase: 0.375, decay: 1 do
      sleep  0.25
      3.times do
        play cd.tick
        sleep  0.25
      end
    end
  end
end


# Hollow --------------------

live_loop :strings_sound, sync: :met do
  if hollow_play < 1 then stop end
  use_synth :hollow # :rodeo
  use_synth_defaults  release: 0,  amp: 2, release: 0.25
  
  with_fx :hpf, cutoff: 95 do
    play :ds6, sustain: 4
    sleep 4
    
  end
end



# Bass ----------------------

live_loop :bass_loop, sync: :met do
  if bass_play < 1 then stop end
  use_synth :dsaw
  use_synth_defaults release: 0.15, cutoff: 40, amp: 1.6, attack: 0.03
  key=:cs1
  
  with_fx :reverb, mix: 0.7, room: 0.5 do
    
    ##| play chord(key, :M7)
    sleep 0.125
    play key
    sleep 0.25
    play key
    sleep 0.375
    play key
    sleep 0.375
    
    play key+5
    sleep 0.375
    
    play key+3
    sleep 0.25
    
    
    play key
    sleep 0.25
    
  end
end
