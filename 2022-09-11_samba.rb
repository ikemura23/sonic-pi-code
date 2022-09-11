use_debug false
clap = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_claps"
percussion = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_drum\ loops/LCKK_percussion\ loops"

use_bpm 63

effect = 0

mero_flag = 0
base_flag = 1
strings_flag = 0

live_loop :met do
  sleep 1
end

define :pattern do |pattern|
  return pattern.ring.tick == "x"
end

live_loop :percussion, sync: :met do
  sample percussion, 10, amp: 0.7, beat_stretch: 4, start: 0, finish: 0.5 #8, 10
  sleep 2
end

live_loop :kick, sync: :met do
  ##| stop
  a = 1.4
  sample :bd_tek , amp: a, cutoff: 100
  sleep 0.5
  
  sample :bd_tek , amp: a, cutoff: 100
  sleep 0.375
  sample :bd_tek, amp: 0.5, cutoff: 100
  sleep 0.125
end

live_loop :hi, sync: :met do
  with_fx :reverb do
    sample :drum_splash_hard
  end
  sleep 16
end


with_fx :echo, mix: 0.2 do
  with_fx :reverb, mix: 0.5, room: 0.5 do
    live_loop :clap, sync: :met do
      ##| stop
      sleep 0.5
      sample clap, 1, amp: 1, lpf: 100
      sleep 0.5
    end
  end
  
  with_fx :panslicer, mix: 0.2 do
    live_loop :hhc1, sync: :met do
      ##| stop
      a = 0.7
      p = [-0.3, 0.3].choose
      sample :drum_cymbal_closed, amp: a, rate: 1, finish: 0.5, pan: p, cutoff: 130 if pattern "x-"
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
    sample :drum_cymbal_open, cutoff: 110, rate: 1, start: 0.01, finish: 0.2, amp: a, attack: at
    sleep 0.25
    sleep 0.25
    sample :drum_cymbal_open, cutoff: 110, rate: 1, start: 0.01, finish: 0.1, amp: a, attack: at
    sleep 0.125
    sample :drum_cymbal_open, cutoff: 110, rate: 1, start: 0.01, finish: 0.1, amp: a, attack: at
    sleep 0.125
  end
end


with_fx :reverb, mix: 0.3, room: 0.5 do
  live_loop :base, sync: :met do
    if base_flag < 1 then stop end
    ##| stop
    use_synth :fm
    a = 1
    n = :bb2+effect
    ##| 4.times do
    ##|   play n, sustain: 0.375, release: 0, amp: a
    ##|   sleep 0.375
    ##|   play n, release: 0.125, sustain: 0, amp: a
    ##|   sleep 0.125
    ##|   play n-5, release: 0, sustain: 0.25, amp: a
    ##|   sleep 0.25
    ##|   play n-5, release: 0, sustain: 0.25, amp: a
    ##|   sleep 0.25
    ##| end
    
    2.times do
      play n, sustain: 0.375, release: 0, amp: a
      sleep 0.375
      play n, release: 0.125, sustain: 0, amp: a
      sleep 0.125
      play n-5, release: 0, sustain: 0.25, amp: a
      sleep 0.25
      play n-5, release: 0, sustain: 0.25, amp: a
      sleep 0.25
      
      sleep 0.125
      play n, sustain: 0.375-0.125, release: 0, amp: a
      sleep 0.375-0.125
      play n, release: 0.125, sustain: 0, amp: a
      sleep 0.125
      play n-5, release: 0, sustain: 0.25, amp: a
      sleep 0.25
      play n-5, release: 0, sustain: 0.25, amp: a
      sleep 0.25
    end
  end
  
end

live_loop :mero, sync: :met do
  if mero_flag < 1 then stop end
  c1 = chord(:bb3+effect, :maj9, invert: 0)
  c2 = chord(:bb3-2+effect, :maj9, invert: 0)
  
  a = 1.5
  at = 0.01 #0.03
  s = 0.125
  use_synth :sine #:sine :saw
  
  with_fx :lpf, cutoff: 130 do
    p = "x-x-xx-x-x-xx-x-"
    32.times do
      play c1, sustain: s, release: 0, attack: at, amp: a if pattern p
      sleep 0.125
    end
    
    32.times do
      play c2, sustain: s, release: 0, attack: at, amp: a if pattern p
      sleep 0.125
    end
  end
  
  ##| with_fx :lpf, cutoff: 100 do
  ##|   play c1, sustain: 0.125*3, release: 0, attack: at, amp: a
  ##|   sleep 0.125*3
  ##|   play c1, sustain: 0.125, release: 0, attack: at, amp: a
  ##|   sleep 0.125*3
  ##|   play c1, sustain: 0.125*3, release: 0, attack: at, amp: a
  ##|   sleep 0.125*3
  ##|   play c1, sustain: 0.125, release: 0, attack: at, amp: a
  ##|   sleep 0.125*3
  
  ##|   play c1, sustain: 0.2, release: 0, attack: at, amp: a
  ##|   sleep 0.125*2
  
  ##|   play c2, sustain: 0.2, release: 0, attack: at, amp: a
  ##|   sleep 0.125*2
  ##| end
  
end


live_loop :strings, sync: :met do
  if strings_flag < 1 then stop end
  a = 3
  with_fx :hpf ,cutoff: 100 do
    c = :bb6+2+effect
    synth :hollow, note: c, sustain: 8, amp: a do |s|
      sleep 7
      control s, note: c-2
      sleep 0.5
      control s, note: c+3
      sleep 0.5
    end
    sleep 8
    ##| c = :bb6+2+effect
    synth :hollow, note: c, sustain: 8, amp: a do |s|
      sleep 2.5
      control s, note: c-2
      sleep 0.5
      control s, note: c+3
      sleep 0.5
      control s, note: c+1
      sleep 0.5
      control s, note: c
      sleep 4
    end
    sleep 8
  end
end
