# output https://twitter.com/ikemura23/status/1522578993483976704

use_bpm 66

hatLoop="/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_drum\ loops/LCKK_hat\ loops"
clap = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_claps"

live_loop :kick do
  sleep 0.5
  sample :bd_tek, amp: 1, lpf: 120, rate: 0.9
end

live_loop :hatLoop, sync: :kick do
  ##| sample hatLoop, 5, beat_stretch: 4, amp: 1, lpf: 110 # 4
  sleep 4
end

live_loop :clap, sync: :kick do
  sleep 1.5 # 0.5 , 1.5
  with_fx :reverb do
    sample clap, 2, amp: 1, lpf: 110
  end
  sleep 0.5
end

live_loop :midle, sync: :kick do
  use_synth :dsaw #:saw #:beep
  
  c = chord(:ds3+7, :m)
  
  with_fx :reverb, room: 0.8, mix: 0.7 do
    with_fx :lpf, cutoff: 130, amp: 1 do
      play c, sustain: 0, release: 0.25
      sleep 0.25
      ##| with_fx :echo,phase: 0.375, decay: 6 do
      play c, sustain: 0, release: 0.25
      ##| end
      sleep 2-0.25
      
      c = chord(:ds3+10, :m)
      play c, sustain: 0, release: 0.25
      sleep 0.25
      ##| with_fx :echo, phase: 0.375, decay: 3 do
      play c, sustain: 0, release: 0.25
      sleep 1.5-0.25
      ##| end
      
      c = chord(:ds3+8, :m)
      play c, sustain: 0, release: 0.5
      sleep 0.5
    end
  end
end

live_loop :pico, sync: :kick do
  use_synth :tech_saws #:prophet
  
  ##| r = [0.125, 0.25, 0.25].shuffle
  with_fx :lpf,cutoff: 120 do
    use_random_seed 1000
    play chord(:ds4, :madd2).shuffle.tick, release: 0.125, amp: 0.5
    sleep 0.125
  end
end

live_loop :base, sync: :kick do
  use_synth :dsaw
  key = :ds1
  amp = 0.7
  
  with_fx :reverb, amp: amp do
    with_fx :lpf, cutoff: 110 do
      n = key
      sleep 0.25
      play n, sustain: 0.125, release: 0
      sleep 0.25
      play n, sustain: 0.125, release: 0
      sleep 0.25
      
      play n, sustain: 0.125, release: 0
      sleep 0.125
      play n+7, sustain: 0.125, release: 0
      sleep 0.25
      
      play n, sustain: 0.125, release: 0
      sleep 0.125
      
      sleep 2-0.25*4-0.125*2
      
      sleep 0.75
      
      n = key+3
      play n, sustain: 0.125, release: 0
      sleep 0.125
      play n+7, sustain: 0.125, release: 0
      sleep 0.25
      
      play n, sustain: 0.125, release: 0
      sleep 0.125
      sleep 2-1-0.25
    end
  end
end

live_loop :base2 ,sync: :kick do
  use_synth :blade
  
  cd =  chord_invert(chord(:ds3+7, :madd4), -1)
  
  use_random_seed 330
  sl = [0.25, 0.25, 0.375, 0.5, 0.125].shuffle
  
  with_fx :reverb do
    ##| with_fx :echo, decay: 0.25 do
    8.times do
      ##| play cd.choose, sustain: 0.125, release: 0, amp: 0.7
      sleep sl.choose
    end
    ##| end
  end
end
