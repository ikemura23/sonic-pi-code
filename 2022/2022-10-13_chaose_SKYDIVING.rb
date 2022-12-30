# output https://twitter.com/ikemura23/status/1580318618260475904

use_debug false
use_bpm 66

clap = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_claps"

mero2_flag = 1
mero3_flag = 0
rand_mero_flag = 0

base_flag = 1
base2_flag = 1

kick_hat_frag = 1
cymbal_open_flat = 0

mero_flag = 0
mero4_flag = 0

live_loop :met do
  sleep 1
end

# drum -------------------

define :pattern do |pattern|
  return pattern.ring.tick == "x"
end


live_loop :kick, sync: :met do
  if kick_hat_frag < 1 then stop end
  a = 1.5
  
  28.times do
    sample :bd_tek, amp: a, cutoff: 130
    sleep 0.5
    
  end
  sleep 2
end

live_loop :splash, sync: :met do
  sample :drum_splash_hard, cutoff: 110
  sleep 8
  sample :drum_splash_soft ,amp: 1.5, cutoff: 100
  sleep 8
end

with_fx :echo, mix: 0.1 do
  with_fx :reverb, mix: 0.5, room: 0.5 do
    
    live_loop :clap, sync: :met do
      ##| stop
      14.times do
        sleep 0.5
        sample clap, 5, amp: 0.8, lpf: 120
        sleep 0.5
      end
      sleep 2
    end
  end
  
  with_fx :panslicer, mix: 0.2 do
    live_loop :hhc1, sync: :met do
      if kick_hat_frag < 1 then stop end
      a = 0.5
      p = [-0.3, 0.3].choose
      sample :drum_cymbal_closed, amp: a, rate: 1.5, finish: 0.5, pan: p, cutoff: 120 if pattern "x-xx"
      sleep 0.125
    end
  end
end

with_fx :hpf, cutoff: 100 do
  live_loop :hh2, sync: :met do
    if cymbal_open_flat < 1 then stop end
    a = 0.8
    at = 0
    sleep 0.25
    sample :drum_cymbal_open, cutoff: 110, rate: 1, start: 0.01, finish: 0.2, amp: a, attack: at
    sleep 0.25
  end
end
# mero ---------------------

live_loop :mero_loop, sync: :met do
  if mero_flag < 1 then stop end
  key = :g3
  
  mero1 chord(key+7,:m7, invert: 0)
  sleep 2
  mero1 chord(key+7, :m7, invert: 0)
  sleep 2
end

with_fx :reverb, mix: 0.5, room: 0.5 do
  define :mero1 do |c,synth=:sine|
    
    a = 1
    use_synth :tb303
    
    with_fx :lpf, cutoff: 110 do
      at = 0.05
      play c, release: 0.3,  attack: at, amp: a
      sleep 0.375
      play c, release: 0.3,  attack: at, amp: a
      sleep 0.375
      play c, release: 0.3,  attack: at, amp: a if [false,true].tick
      sleep 0.375
      sleep 2-0.375*3
    end
  end
  
  define :mero2 do |c,synth=:sine,sl=2|
    if mero_flag < 1 then stop end
    
    a = 1.5
    use_synth synth
    
    play c, release: sl*1.3, amp: a
    sleep sl
  end
  
  live_loop :mero3 , sync: :met do
    if mero3_flag < 1 then stop end
    
    a = 0.6
    use_synth :dpulse
    
    c = chord(:g3, :m9, invert: 0)
    with_fx :echo, mix: 0.2 do
      ##| with_fx :wobble,invert_wave: 0, phase: rrand(0.2, 1), wave: 0, mix: 0.9 do
      play c+[0].choose, sustain: 0.125, release: 0, amp: a if pattern "x--x--x---x--x--"
      sleep 0.125
    end
    ##| end
  end
  
  live_loop :mero4 , sync: :met do
    if mero4_flag < 1 then stop end
    
    a = 0.6
    use_synth :dpulse
    
    c = chord(:g3, :m7, invert: 0)
    with_fx :echo, mix: 0.2 do
      #pattern "x--x--x--x--x-x-x--x--x-x-x-x-x-"
      
      play c, sustain: 0.3, release: 0, amp: a
      sleep 0.375
      play c, sustain: 0.3, release: 0, amp: a
      sleep 0.375
      play c, sustain: 0.3, release: 0, amp: a
      sleep 0.375
      play c, sustain: 0.3, release: 0, amp: a
      sleep 0.375
      play c, sustain: 0.2, release: 0, amp: a
      sleep 0.25
      play c, sustain: 0.2, release: 0, amp: a
      sleep 0.25
      
      c+=3
      play c, sustain: 0.3, release: 0, amp: a
      sleep 0.375
      play c, sustain: 0.3, release: 0, amp: a
      sleep 0.375
      c+=2
      play c, sustain: 0.3, release: 0, amp: a
      sleep 0.375
      play c, sustain: 0.3, release: 0, amp: a
      sleep 0.375
      play c, sustain: 0.2, release: 0, amp: a
      sleep 0.25
      play c, sustain: 0.2, release: 0, amp: a
      sleep 0.25
    end
    ##| end
  end
end


live_loop :mero_loop2, sync: :met do
  if mero2_flag < 1 then stop end
  with_fx :reverb, mix: 0.3, room: 0.5 do
    use_synth :dsaw
    c = chord(:g2+7, :m9)
    a = 1
    with_fx :lpf, cutoff: 120 do
      play c, sustain: 0.25,release: 0, amp: a
      sleep 0.375
      play c+3, sustain: 0.25, release: 0,amp: a
      sleep 0.375
      play c+8, sustain: 0.25, release: 0, amp: a
      sleep 0.375
      sleep 0.125
      
      play c+11, sustain: 0.25, release: 0, amp: a
      sleep 0.25
      
      play c+16, sustain: 0.25, release: 0, amp: a
      sleep 0.25
      play c+20, sustain: 0.25, release: 0, amp: a
      sleep 0.25
    end
  end
end

# base -----------------

live_loop :base, sync: :met do
  if base_flag < 1 then stop end
  
  base :g2
  
end

live_loop :base2, sync: :met do
  if base2_flag < 1 then stop end
  
  base2 :g2
end

define :base do |c|
  with_fx :reverb, mix: 0.3, room: 0.5 do
    
    use_synth :fm
    a = 1
    with_fx :lpf, cutoff: 120 do
      play c, release: 0.2, amp: a
      sleep 0.375
      play c, release: 0.2, amp: a
      sleep 0.375
      play c, sustain: 0.2, release: 0, amp: a
      sleep 0.375
      sleep 0.125
      
      play c+5, sustain: 0.125, release: 0, amp: a
      sleep 0.375
      
      play c+3, sustain: 0.125, release: 0, amp: a
      sleep 0.375
      
      ##| sleep 0.25
      ##| play c, sustain: 0.2, release: 0, amp: a
      ##| sleep 0.5
      ##| play c, sustain: 0.2, release: 0,amp: a
      ##| sleep 0.5
      
      ##| play c+5, sustain: 0.125, release: 0, amp: a
      ##| sleep 0.375
      
      ##| play c+3, sustain: 0.125, release: 0, amp: a
      ##| sleep 0.375
    end
  end
end

define :base2 do |c|
  with_fx :reverb, mix: 0.5, room: 0.5 do
    
    use_synth :square # :square :dpulse
    a = 0.9
    sleep 1.25
    
    play c+5, release: 0.12, amp: a
    sleep 0.375
    
    play c+[3].tick, release: 0.12, amp: a
    sleep 0.375
  end
end


live_loop :rand_mero, sync: :met do
  if rand_mero_flag < 1 then stop end
  n = (scale :f3, :chromatic, num_octaves: 2).choose
  use_synth :supersaw
  a = 2
  with_fx :bpf do
    play n, release: 0.15, amp: a
    sleep 0.125
  end
end
