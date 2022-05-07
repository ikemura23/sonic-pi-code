#output https://twitter.com/ikemura23/status/1522781812635758592

use_bpm 70

hatLoop="/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_drum\ loops/LCKK_hat\ loops"
clap = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_claps"

live_loop :kick do
  sleep 0.5
  sample :bd_tek, amp: 1, lpf: 120, rate: 0.9
end

live_loop :hatLoop, sync: :kick do
  sample hatLoop, 5, beat_stretch: 4, amp: 1, lpf: 110 # 4
  sleep 4
end

live_loop :clap, sync: :kick do
  sleep 0.5
  with_fx :reverb do
    sample clap, 1, amp: 1, lpf: 110
  end
  sleep 0.5
end

live_loop :midle, sync: :kick do
  use_synth :dsaw #:saw #:beep
  
  with_fx :reverb, room: 0.7, mix: 0.8 do
    with_fx :lpf, cutoff: 130, amp: 0.7 do
      with_fx :wobble, cutoff_max: rrand(90, 110), phase: 8 do
        sleep 15.5
        play chord(:ds4+7, :m9), sustain: 0, release: 6
        play chord(:ds3+7, :m), sustain: 0, release: 6
        sleep 0.5
        ##| sleep 16
      end
    end
  end
end

live_loop :pico, sync: :kick do
  use_synth :tech_saws #:prophet
  
  with_fx :lpf,cutoff: 120 do
    use_random_seed 1000
    play chord(:ds4, :madd2).tick, release: 0.125, amp: 0.7
    sleep 0.125
  end
end

live_loop :base, sync: :kick do
  use_synth :dsaw
  key = :ds1
  amp = 0.8
  
  with_fx :reverb, amp: amp, room: 0.7 do
    with_fx :lpf, cutoff: 100 do
      n = key
      8.times do |i|
        if i == 4 then n=n+3 end
        if i == 7 then n=n+2 end
        sleep 0.125
        3.times do
          play n, sustain: 0.09, release: 0
          play n+24, sustain: 0.1, release: 0, amp: 0.15
          sleep 0.125
          sleep 0.5-0.125*4
        end
      end
    end
  end
end

live_loop :mero ,sync: :kick do
  use_synth :zawa
  
  cd =  chord_invert(chord(:ds3+7, :madd4), -1)
  amp = 0
  
  use_random_seed 370 #370 1000 5000 6000
  sl = [0.25, 0.25, 0.375, 0.5, 0.125].shuffle
  
  with_fx :reverb, amp: amp do
    ##| with_fx :echo, decay: 0.25 do
    8.times do
      play cd.choose, sustain: 0.125, release: 0, amp: [0.7, 0.3].choose
      sleep sl.choose
    end
    ##| end
  end
end

live_loop :low, sync: :kick do
  use_synth :hollow
  
  ef = [0,0,0,0,0,0,7,7]
  8.times do |i|
    if i==7
    then c = chord(:ds4+ef.tick, :m7)
    else c = chord(:ds4+ef.tick, :m)
    end
    
    play c, release: 0, sustain: 1, amp: 2
    
    sleep 1
  end
  
  
  ##| with_fx :wobble, wave: 2, phase: 8 do
  ##| play chord(:ds4+7, :m7), release: 0, sustain: 8, amp: 2
  ##| sleep 8
  ##| end
end
