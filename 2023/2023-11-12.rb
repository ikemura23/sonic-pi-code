# inspier https://youtu.be/herN5NmWtKM?si=yTdCFgA261Y7CMMQ&t=4088

clap = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_claps"

drum_play = 1
splash_play = 1

melody_play = 1
bass_play = 1
hollow_play = 0

live_loop :met do
  sleep 0.5
end

# Drum --------------------

live_loop :kick, sync: :met do
  if drum_play < 1 then stop end
  use_sample_defaults amp: 1, lpf: 130
  sample :bd_tek # :bd_haus :bd_tek :bd_ada
  sleep 0.5
end

live_loop :hhc1, sync: :met do
  if drum_play < 1 then stop end
  with_fx :hpf, cutoff: 100, amp: 0.8 do
    sample :hat_psych, amp: 0.5, rate: 1
    sleep 0.25
  end
end

live_loop :cymbal_open, sync: :met do
  if drum_play < 1 then stop end
  sleep 0.25
  with_fx :distortion do
    sample :hat_cats, lpf: 100, amp: 1.1
  end
  ##| sample :drum_cymbal_open, amp: 0.25, beat_stretch: 1.8, finish: 0.125, hpf: 90#, rate: 1.1
  sleep 0.25
end

# clap
live_loop :clap, sync: :met do
  if drum_play < 1 then stop end
  sleep 0.5
  with_fx :reverb, mix: 0.3 do
    sample clap, 0, amp: 1, lpf: 120, rate: 0.9
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



# Random Melody ------------------

live_loop :chord, sync: :met do
  if melody_play < 1 then stop end
  use_synth :dsaw
  use_synth_defaults release: 2, cutoff: 80
  
  4.times do |i|
    ##| ef = 0
    ef = if i == 3 then 3 else 0 end
    sleep 0.75
    ##| with_fx :wobble, phase: 3, invert_wave: 0, mix: 0.2, wave: 2 do
    with_fx :slicer, mix: 0.15, phase: 0.375 do
      play chord(:g3+ef, :M7)
      sleep 2-0.75
    end
  end
end



# Hollow --------------------

live_loop :mero2, sync: :met do
  if hollow_play < 1 then stop end
  with_fx :slicer, phase: 3, mix: 0.2 do
    synth :hollow, note: chord(:g3, :M7, invert: 2), release: 0, sustain: 8, amp: 2.5
  end
  sleep 8
end



# Bass ----------------------

live_loop :bass_loop, sync: :met do
  if bass_play < 1 then stop end
  use_random_seed 2398 #7890
  sl = [0.25, 0.25, 0.375, 0.375, 0.375, 0.375, 0.125, 0.375,
        0.25, 0.375,  0.125, 0.25,0.25, 0.25]
  c = chord(:g1, :M7, invert: 1)
  with_fx :reverb, mix: 0.5, room: 0.3 do
    with_fx :lpf, cutoff: 85 do
      sl.size.times do
        
        n = c.choose
        synth :sine, note: n+12*2, release: 0.1, amp: 0.7
        synth :fm, note: n, release: 0.2, amp: 1.5
        sleep sl.tick
      end
    end
  end
end

