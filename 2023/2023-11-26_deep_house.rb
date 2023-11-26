use_bpm 62

claps = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_claps"

drum_play = 1
drum_hat_clap = 1
splash_play = 1

synth1_play = 0
synth2_play = 1

bass1_play = 0
bass2_play = 1

hollow_play = 1
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
  use_synth :dsaw
  use_synth_defaults release: 0.15, cutoff: 130, amp: 1.2
  key=:cs4
  i=-3
  
  with_fx :reverb, mix: 0.7, room: 0.5 do
    
    ##| play chord(key, :m7, invert: i)
    sleep 0.125
    play chord(key, :m7, invert: i)
    sleep 0.25
    play chord(key, :m7, invert: i)
    sleep 0.375
    play chord(key, :m7, invert: i)
    sleep 0.375
    
    play chord(key+7, :m7, invert: i)
    sleep 0.375
    
    play chord(key+7, :m7, invert: i)
    sleep 0.25
    
    play chord(key+7, :m7, invert: i)
    sleep 0.25
    
    play chord(key+3, :m7, invert: i)
    sleep 0.125
    sleep 0.25
    play chord(key+3, :m7, invert: i)
    sleep 0.375
    play chord(key+3, :m7, invert: i)
    sleep 0.375
    
    play chord(key+2, :m7, invert: i)
    sleep 0.375
    play chord(key+2, :m7, invert: i)
    sleep 0.25
    play chord(key+2, :m7, invert: i)
    sleep 0.25
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
  
  with_fx :hpf, cutoff: 100 do
    play :ds7, sustain: 4
    sleep 4
    
  end
end



# Bass ----------------------

live_loop :bass1, sync: :met do
  if bass1_play < 1 then stop end
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

live_loop :bass2, sync: :met do
  if bass2_play < 1 then stop end
  use_synth :dsaw
  use_synth_defaults release: 0.15, cutoff: 50, amp: 1.6, attack: 0.03
  key=:cs1
  
  with_fx :reverb, mix: 0.7, room: 0.5 do
    
    ##| play chord(key, :m7, invert: i)
    sleep 0.125
    play key
    sleep 0.25
    play key
    sleep 0.375
    play key
    sleep 0.375
    
    play key+7
    sleep 0.375
    
    play key+7
    sleep 0.25
    
    play key+7
    sleep 0.25
    
    play key+3
    sleep 0.125
    sleep 0.25
    play key+3
    sleep 0.375
    play key+3
    sleep 0.375
    
    play key+2
    sleep 0.375
    play key+2
    sleep 0.25
    play key+2
    sleep 0.25
    
  end
end
