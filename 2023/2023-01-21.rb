# twitter output https://twitter.com/ikemura23/status/1616778477679828992

use_debug false

clap = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_claps"

kick_flag = 0
hat_flag = 0
hat3_flag = 0
cymbal_open_flag = 0

clap_flag = 1
snare_flag = 0
##| long_clap_flag = 1

base_flag = 0

live_loop :met do
  sleep 1
end

with_fx :reverb, room: 0.3 do
  with_fx :lpf, cutoff: 110 do
    live_loop :kick, sync: :met do
      if kick_flag < 1 then stop end
      sample :bd_fat, amp: 1.4, cutoff: 120 # :bd_fat :bd_tek
      sleep 0.5
    end
    
    live_loop :hhc1, sync: :met do
      if hat_flag < 1 then stop end
      
      4.times do
        sample :drum_cymbal_closed, amp: 0.8, rate: 1.5
        sleep 0.125
      end
      sample :drum_cymbal_closed, amp: 0.9, rate: 2
      sleep 0.25
      sample :drum_cymbal_closed, 15, amp: 0.9, rate: 2
      sleep 0.25
    end
    
    live_loop :hhc2, sync: :met do
      if hat_flag < 1 then stop end
      
      sleep 0.125
      sample :drum_cymbal_closed, amp: 0.8, rate: 1
      sleep 1-0.125
    end
    
    live_loop :hhc3, sync: :met do
      if hat3_flag < 1 then stop end
      
      sleep 0.25
      sample :drum_cymbal_closed, amp: 1.5, lpf: 110
      sleep 0.25
    end
    
    live_loop :cymbal_open, sync: :met do
      if cymbal_open_flag < 1 then stop end
      sleep 0.25
      sample :drum_cymbal_open, amp: 0.25, beat_stretch: 2, finish: 0.125, hpf: 100, rate: 1.1
      sleep 0.25
    end
    
    live_loop :splash_soft, sync: :met do
      sample :drum_splash_soft
      sleep 32
    end
    
    ##| live_loop :long_clap, sync: :met do
    ##|   if long_clap_flag < 1 then stop end
    ##|   sleep 1
    ##|   with_fx :reverb, mix: 0.9,room: 0.9 do
    ##|     sample clap, 0, amp: 0.8, beat_stretch: rrand(1, 2), rate: rrand(0.8, 2)
    ##|   end
    ##|   sleep 1
    ##| end
    
    live_loop :snare_soft, sync: :met do
      if snare_flag < 1 then stop end
      r = 2.5
      sample_name = :drum_snare_hard
      a = 0.5
      
      sample sample_name, rate: r, amp: a
      sleep 0.125
      sample sample_name, rate: r, amp: a
      sleep 0.125
      
      sleep 0.25
      sleep 0.375
      sample sample_name, rate: r, amp: a/2
      
      sleep 0.375
      sample sample_name, rate: r, amp: a/2
      sleep 0.375
      sample sample_name, rate: r, amp: a
      sleep 0.25
      
      sleep 2-0.125*2-0.25*2-0.375*3
      
    end
    
    
    live_loop :clap, sync: :met do
      if clap_flag < 1 then stop end
      
      8.times do |i|
        if i < 7 then
          sleep 0.5
          sample clap, 0, amp: 1, lpf: 120, rate: 1.1
          sleep 0.5
        else
          sleep 0.5
          sample clap, 0, amp: 1, lpf: 120, rate: 1.1
          sleep 0.375
          sample clap, 0, amp: 1, lpf: 120, rate: 1.1
          sleep 0.125
        end
      end
    end
  end
end

## mero ------------------------

with_fx :reverb, mix: 0.7, room: 0.7 do
  live_loop :mero1_hollow, sync: :met do
    ##| stop
    a = 1
    
    r = 0
    s = 4
    key1 = :f3
    key2 = :g3 # :c3
    sleep 0.25
    
    synth :hollow, note: chord(:b4, :m7, invert: 0), release: r, sustain: s, amp: a
    synth :hollow, note: chord(:b3, :m7, invert: 2), release: r, sustain: s, amp: a
    sleep s-0.25
    
    sleep 0.25
    synth :hollow, note: chord(:e4, :m7, invert: 0), release: r, sustain: s, amp: a
    synth :hollow, note: chord(:e3, :m7, invert: 0), release: r, sustain: s, amp: a
    sleep s-0.25
  end
  
  live_loop :mero1, sync: :met do
    
    r = 4
    s = 4
    
    sleep 0.25
    with_fx :lpf, cutoff: 80 do
      with_fx :slicer, phase: 0.5, mix: 0, invert_wave: 0 do
        synth :dsaw, note: chord(:b4, :m7, invert: -1), release: r, amp: 0.5
        synth :sine, note: chord(:b3, :m7, invert: -1), release: r, amp: 1
        ##| synth :fm, note: :gb2, release: r, amp: 1
        sleep s-0.25
        
        sleep 0.25
        synth :dsaw, note: chord(:e4, :m7, invert: 0), release: r, amp: 0.5
        synth :sine, note: chord(:e3, :m7, invert: 0), release: r, amp: 1
        ##| synth :fm, note: :d2, release: r, amp: 1
        sleep s-0.25
      end
    end
  end
  
  live_loop :mero2, sync: :met do
    ##| stop
    n = :b3
    r = 2-0.25
    at = 0
    
    sleep 14+0.25
    synth :hollow, note: chord(n, :m7, invert: 0), release: r, amp: 3
    sleep 2-0.25
  end
  
  live_loop :mero2_slicer, sync: :met do
    
    n = :b3
    r = 2-0.25
    at = 0
    
    sleep 14+0.25
    
    with_fx :lpf, cutoff: 80 do
      synth :dsaw, note: chord(n, :m7, invert: 0), release: r, attack: at, amp: 0.5
      synth :sine, note: chord(n+12, :m7, invert: 0), release: r, amp: 1
      sleep 2-0.25
    end
  end
  
end

## base ------------------------

live_loop :base, sync: :met do
  if base_flag < 1 then stop end
  
  key = :D1+[0,0,0,2].tick
  
  with_fx :lpf, cutoff: 80, amp: 1.8 do
    
    with_fx :wobble, phase: 0.25, invert_wave: 0 do
      sleep 0.25
      synth  :chiplead, note: key, release: 0, sustain: 0.25
      sleep 0.25
      sleep 1.25
      synth :chiplead, note: key, release: 0, sustain: 0.25
      sleep 0.25
    end
  end
end
