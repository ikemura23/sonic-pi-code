# output https://twitter.com/ikemura23/status/1566932161714077696

clap = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_claps"

effect = 0

live_loop :met do
  sleep 1
end

live_loop :kick, sync: :met do
  sample :bd_tek, amp: 1.5, cutoff: 130
  sleep 0.5
end

define :pattern do |pattern|
  return pattern.ring.tick == "x"
end

define :clap1 do | amp = 1.2, lpf = 130 |
  
  with_fx :reverb do
    sample clap, 0, amp: amp, lpf: lpf
  end
  sleep 0.5
end

live_loop :splash, sync: :met do
  with_fx :reverb do
    sample :drum_splash_hard, amp: 0.6
  end
  sleep 16
end

live_loop :clap, sync: :met do
  sleep 0.5
  clap1
end

with_fx :reverb, mix: 0.2 do
  with_fx :panslicer, mix: 0.2 do
    live_loop :hhc1, sync: :met do
      ##| stop
      a = 0.9
      p = [-0.3, 0.3].choose
      sample :drum_cymbal_closed, amp: a, rate: 1.2, finish: 0.5, pan: p, cutoff: 130 if pattern "x-x-x-xx"
      sleep 0.125
    end
  end
end

with_fx :hpf, cutoff: 100 do
  live_loop :hh2, sync: :met do
    ##| stop
    a = 0.8
    at = 0
    sleep 0.25
    sample :drum_cymbal_open, cutoff: 110, rate: 1.2, start: 0.01, finish: 0.2, amp: a,attack: at
    sleep 0.25
  end
end

# ================

live_loop :mero, sync: :met do
  
  key = :b3 + effect
  a = 1
  al = 0
  use_synth :saw
  
  with_fx :hpf, cutoff: 30 do
    
    with_fx :slicer, phase: 0.375 do
      
      c1 = chord(key, :M7, invert: -1)
      c2 = chord(key, :m9, invert: -3)
      c3 = chord(key, :M7, invert: -2)
      
      cg = play c1, sustain: 4, release: 0, amp: a
      sleep 2.1
      control cg, notes: c2
      sleep 0.9
      control cg, notes: c3
      sleep 1
    end
    
    with_fx :slicer, phase: 0.375 do
      
      c1 = chord(key, :M7, invert: -1)
      c2 = chord(key, :M7, invert: 2)
      c3 = chord(key, :M7, invert: 1)
      
      cg = play c1, sustain: 4, release: 0, amp: a
      sleep 2.1
      control cg, notes: c2
      sleep 0.9
      control cg, notes: c3
      sleep 1
    end
  end
end

live_loop :bass, sync: :met do
  a = 1
  key = :b2 + effect
  with_fx :slicer, phase: 0.375 do
    
    c1 = chord(key, :m9, invert: -1).first
    c2 = chord(key, :m9, invert: -3).first
    c3 = chord(key-12, :m7, invert: 1).first
    
    play c1, sustain: 2.1, release: 0, amp: a
    sleep 2.1
    play c2, sustain: 0.9, release: 0, amp: a
    control
    sleep 0.9
    play c3, sustain: 1, release: 0, amp: a
    sleep 1
  end
  
  with_fx :slicer, phase: 0.375 do
    
    c1 = chord(key, :m9, invert: -1).first
    c2 = chord(key, :M7, invert: 2).first
    c3 = chord(key-12, :m7, invert: 1).first
    
    play c1, sustain: 2.1, release: 0, amp: a
    sleep 2.1
    play c2, sustain: 0.9, release: 0, amp: a
    control
    sleep 0.9
    play c3, sustain: 1, release: 0, amp: a
    sleep 1
  end
end

live_loop :strings, sync: :met do
  a = 4
  with_fx :hpf ,cutoff: 60 do
    c = :b5+11+effect
    synth :hollow, note: c, sustain: 4, amp: a do |s|
      sleep 3
      control s, note: c-2
      sleep 0.5
      control s, note: c+3
      sleep 0.5
    end
    sleep 4
    synth :hollow, note: c, sustain: 4, amp: a do |s|
      sleep 3
      control s, note: c-2
      sleep 1
    end
    sleep 4
  end
end

live_loop :strings2, sync: :met do
  a = 0.4
  
  key = :b2+effect
  cd = chord(key, :M7, invert: 4)
  synth :sine, note: cd, sustain: 3, release: 0, amp: a
  sleep 3
  cd = chord(key, :M7, invert: 2)
  synth :sine, note: cd, sustain: 1, release: 0,amp: a
  sleep 1
  
end
