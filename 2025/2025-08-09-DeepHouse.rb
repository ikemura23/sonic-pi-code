# Original : Like A Shadow https://music.youtube.com/watch?v=RfcAV8pWSQs&si=GV9a1-ZIbKIGmC2T

claps = "/Users/k_ikemura/Music/sonic_pi/LCC_CHELL_HOUSE/one\ shots/LCC_Claps"

use_bpm 60

live_loop :met do
  sleep 0.5
end

# Drum ########################

live_loop :kick, sync: :met do
  
  stop
  
  28.times do
    sample :bd_tek, amp: 2
    sleep 0.5
  end
  
  sleep 2
end

# Hat ########################

live_loop :hats_sample_2, sync: :met do
  stop
  use_sample_defaults amp: 0.6
  
  28.times do
    sleep 0.25
    sample :hat_star
    sleep 0.25
  end
  sleep 2
end

live_loop :splash_hard, sync: :met do
  stop
  sample :drum_cymbal_hard
  sleep 8
  
end

# Clap ########################

live_loop :clap, sync: :met do
  stop
  use_sample_defaults amp: 1.1
  sleep 0.5
  with_fx :reverb, mix: 0.1 do
    sample claps, 5
  end
  
  sleep 0.5
end


# Synth ########################

live_loop :synth_x, sync: :met do
  stop
  
  default_release = 4
  default_cutoff = 80
  
  use_synth :dsaw
  use_synth_defaults release: default_release,
    cutoff: default_cutoff, amp: 1.2,  attack: 0.2
  
  fx_mix  = 0.2
  
  with_fx :wobble, phase: 4, mix: fx_mix, wave: 0 do
    with_fx :slicer, mix: 0.3, phase: 0.25 do
      with_fx :hpf,cutoff: 70 do
        play chord(:bb3, :M7)
        sleep 4
        
        play chord(:a3, :m7)
        sleep 4
      end
    end
  end
end

live_loop :synth_1, sync: :met do
  ##| stop
  
  use_synth :piano # :piano
  use_synth_defaults release: 2, amp: 1.2
  
  gs1 = :gs2
  gs2 = gs1+12
  as  = :as3
  fs1 = :fs3
  fs2 = fs1+12
  b   = :b2
  cs1 = :cs3
  cs2 = cs1+12
  ds1 = :ds3
  ds2 = ds1+12
  f   = :f3
  
  pattern1 = [ gs1, gs2, as, fs2 ]
  pattern2 = [ b, gs2, as, fs2 ]
  pattern3 = [ cs1, f, fs1, cs2 ]
  pattern4 = [ ds1, f, fs1, cs2 ]
  
  fx_phase = 0.5
  fx_mix = 0.5
  
  with_fx :echo, phase: fx_phase, decay: 4,   mix: fx_mix do
    with_fx :reverb, room: 0.9, mix: 0.7 do
      play_pattern_timed pattern1, 0.25
      sleep 0.75
      
      in_thread do
        play_pattern_timed pattern2, 0.01
      end
      sleep 1.25
      sleep 1
      
      play_pattern_timed pattern3, 0.25
      sleep 0.75
      
      in_thread do
        play_pattern_timed pattern4, 0.01
      end
      sleep 1.25
      sleep 1
    end
  end
end

live_loop :synth_3, sync: :met do
  stop
  
  use_synth :prophet # :dtri or :tech_saws
  use_synth_defaults release: 1.5, amp: 1.2
  
  ##| f = chord(:f5, :M7, invert: 0)
  ##| d = chord(:d4, :M7, invert: 0)
  
  a = :a4
  d = :d5
  c = :c5
  g = :g4
  f = :f4
  
  notes = [
    a, 0, 0, 0,
    0, 0, d, c,
    0, a, 0, 0,
    d-12, f, g, 0,
  ]
  
  fx_phase = 1.5
  fx_mix = 1
  
  notes.each do |note|
    with_fx :reverb, room: 0.7, mix: 0.7 do
      with_fx :wobble, phase: fx_phase, mix: fx_mix, invert_wave: 0 do
        play note if note != 0
        sleep 0.25
      end
    end
  end
end


# Bass ########################

live_loop :bass_loop, sync: :met do
  
  stop
  
  use_synth :dsaw
  use_synth_defaults release: 0.08, cutoff: 100, amp: 1.2, sustain: 0.1
  
  ds = :ds2
  fs = :fs2
  cs = :cs2
  gs = :gs3
  
  notes = [
    0, ds, 0,  ds,
    0, 0,  0,  ds,
    0, 0,  ds, 0,
    0, 0,  ds, 0,
    
    0, fs, 0,  fs+12,
    0, 0,  0,  fs,
    0, 0,  fs, 0,
    0, 0,  fs, 0,
    
    0, cs, 0,  cs+12,
    0, 0,  0,  cs,
    0, 0,  cs, 0,
    0, 0,  cs, 0,
    
    0, ds, 0,  ds+12,
    0, 0,  0,  ds,
    0, 0,  ds, fs+12,
    0, 0,  ds, gs,
  ]
  
  with_fx :reverb, mix: 0.3 do
    with_fx  :lpf, cutoff: 80, mix: 1 do
      p = notes.tick
      
      notes.each do |note|
        play note if note != 0
        sleep 0.125
      end
    end
  end
end
