# output https://twitter.com/ikemura23/status/1615724619880894465

use_debug false

clap = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_claps"
hat = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_hats"

kick_flag = 0
hat_flag = 0
hat3_flag = 0
cymbal_open_flag = 0

clap_flag = 0
long_clap_flag = 0

mero3_flag = 1
base_flag = 0

live_loop :met do
  sleep 1
end

with_fx :reverb, room: 0.3 do
  live_loop :kick, sync: :met do
    if kick_flag < 1 then stop end
    sample :bd_tek, amp: 1.4, cutoff: 120
    sleep 0.5
  end
  
  live_loop :hhc1, sync: :met do
    if hat_flag < 1 then stop end
    
    4.times do
      sample hat, 15, amp: 0.6, rate: 3
      sleep 0.125
    end
    sample hat, 15, amp: 0.6, rate: 2
    sleep 0.25
    sample hat, 15, amp: 0.6, rate: 2
    sleep 0.25
  end
  
  live_loop :hhc2, sync: :met do
    if hat_flag < 1 then stop end
    
    sleep 0.125
    sample hat, 15, amp: 0.5, rate: 1.5
    sleep 1-0.125
  end
  
  live_loop :hhc3, sync: :met do
    if hat3_flag < 1 then stop end
    
    sleep 0.25
    sample hat, 4, amp: 1, lpf: 100
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
  
  live_loop :long_clap, sync: :met do
    if long_clap_flag < 1 then stop end
    sleep 1
    with_fx :reverb, mix: 0.9,room: 0.9 do
      sample clap, 0, amp: 0.8, beat_stretch: rrand(1, 2), rate: rrand(0.8, 2)
    end
    sleep 1
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

## mero ------------------------

with_fx :reverb, mix: 0.7, room: 0.7 do
  live_loop :mero1_hollow, sync: :met do
    
    a = 3
    
    ##| r = 8
    ##| synth :hollow, note: chord(:f3, :m7, invert: 0), release: r, sustain: 0, amp: a
    ##| synth :hollow, note: chord(:f3-5, :m7, invert: 2), release: r, sustain: 0, amp: a
    ##| sleep 16
    
    r = 0
    s = 8
    key1 = :f3
    key2 = :g3 # :c3
    with_fx :wobble, invert_wave: [1,0].tick, phase: 16, mix: 0 do
      synth :hollow, note: chord(key1, :m7, invert: 0), release: r, sustain: s, amp: a
      synth :hollow, note: chord(:c3, :m7, invert: 2), release: r, sustain: s, amp: a
      sleep s
      synth :hollow, note: chord(key2, :m, invert: 0), release: r, sustain: s, amp: a
      synth :hollow, note: chord(:c3, :m, invert: 0), release: r, sustain: s, amp: a
      sleep s
    end
  end
  
  live_loop :mero1_slicer, sync: :met do
    
    tonic = :f3
    name = :m7
    
    r = 8
    s = 16
    
    with_fx :slicer, phase: 0.5, mix: 0.5, invert_wave: 1 do
      synth :dsaw, note: chord(tonic, name, invert: 0), release: r, amp: 0.5
      synth :sine, note: chord(tonic+12, name, invert: -2), release: r, amp: 1
      sleep s
    end
  end
  
  live_loop :mero2, sync: :met do
    n = :f3-5
    r = 2
    at = 0.01
    
    sleep 14
    synth :hollow, note: chord(n, :m, invert: 0), release: r, amp: 3
    sleep 2
  end
  
  live_loop :mero2_slicer, sync: :met do
    
    n = :f3-5
    r = 3
    at = 0
    
    sleep 14
    
    with_fx :slicer, phase: 0.5, mix: 0.5, invert_wave: 1 do
      synth :dsaw, note: chord(n, :m, invert: 0), release: r, attack: at, amp: 0.5
      synth :sine, note: chord(n+12, :m, invert: -2), release: r, amp: 1
      sleep 2
    end
  end
  
  live_loop :mero3, sync: :met do
    if mero3_flag < 1 then stop end
    use_synth :dsaw
    a = 2
    at = 0.1
    r = 0
    s = 8
    
    key = :c3
    synth :hollow, note: chord(key, :m7, invert: 0), release: r, sustain: s, amp: a, attack: at
    sleep s
    synth :hollow, note: chord(key, :m, invert: 0), release: r, sustain: s, amp: a, attack: at
    sleep s
  end
end

## base ------------------------

live_loop :base, sync: :met do
  if base_flag < 1 then stop end
  
  key = :f2+[3,7].tick
  with_fx :lpf, cutoff: 50, amp: 2.5 do
    4.times do
      sleep 0.25
      synth :fm, note: key, release: 0, sustain: 0.25
      ##| synth :dsaw, note: key-12, release: 0, sustain: 0.25, cutoff: 70
      sleep 0.25
      sleep 1.25
      
      synth :fm, note: key-5, release: 0, sustain: 0.25
      ##| synth :dsaw, note: key-12, release: 0, sustain: 0.25, cutoff: 70
      sleep 0.25
    end
  end
end
