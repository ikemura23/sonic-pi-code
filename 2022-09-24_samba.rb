use_debug false
clap = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_claps"
percussion = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_drum\ loops/LCKK_percussion\ loops"

effect = 0
invert = 0

mero_flag = 1
cymbal_open_flag = 0
base_flag = 0
snare_flag = 0
cowbel_flag = 0
triangle_flag = 0

live_loop :met do
  sleep 1
end

# drum -------------------

define :pattern do |pattern|
  return pattern.ring.tick == "x"
end

live_loop :percussion, sync: :met do
  ##| sample percussion, 10, amp: 0.7, beat_stretch: 4, start: 0, finish: 0.5 #8, 10
  sleep 2
end

live_loop :kick, sync: :met do
  ##| stop
  a = 1.4
  
  14.times do
    sample :bd_tek, amp: a, cutoff: 90
    sleep 0.5
    
    sample :bd_tek, amp: a, cutoff: 90
    sleep 0.375
    sample :bd_tek, amp: 1, cutoff: 90
    sleep 0.125
  end
  sleep 2
end

live_loop :splash, sync: :met do
  ##| sample :drum_splash_hard
  sleep 8
  ##| sample :drum_splash_soft ,amp: 1.3
  sleep 8
end

with_fx :echo, mix: 0.2 do
  with_fx :reverb, mix: 0.5, room: 0.5 do
    live_loop :clap, sync: :met do
      ##| stop
      14.times do
        sleep 0.5
        sample clap, 3, amp: 1, lpf: 100
        sleep 0.5
      end
      sleep 2
    end
    
    live_loop :snare, sync: :met do
      if snare_flag < 1 then stop end
      a = 1.4
      sample :drum_snare_soft, finish: 0.25, amp: a
      sleep 0.125
      sample :drum_snare_soft, finish: 0.25, amp: a
      sleep 0.25
      sample :drum_snare_soft, finish: 0.25, amp: a
      sleep 0.25
    end
    
    live_loop :cowbel , sync: :met do
      if cowbel_flag < 1 then stop end
      a = 0.4
      sample :drum_cowbell, rate: 0.5, amp: a
      sleep 0.375
      sample :drum_cowbell, rate: 0.5, amp: a
      sleep 0.375
      sleep 0.25
    end
  end
  
  with_fx :panslicer, mix: 0.2 do
    live_loop :hhc1, sync: :met do
      a = 0.7
      p = [-0.3, 0.3].choose
      ##| sample :drum_cymbal_closed, amp: a, rate: 1, finish: 0.5, pan: p, cutoff: 130 if pattern "x-xx"
      sleep 0.125
    end
  end
end

live_loop :triangle, sync: :met do
  if triangle_flag < 1 then stop end
  sample :elec_triangle, amp: 0.1
  sleep 0.25
  sample :elec_triangle, amp: 1
  sleep 0.25
end

with_fx :hpf, cutoff: 100 do
  live_loop :hh2, sync: :met do
    if cymbal_open_flag < 1 then stop end
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

# mero ----------------

live_loop :mero, sync: :met do
  if mero_flag < 1 then stop end
  
  key = :d3
  synth = :saw #:sine :saw
  
  c1 = chord(key+effect,:maj9, invert: 0)
  c2 = chord(key+effect, :m9, invert: 2)
  c3 = chord(key+3+effect, :maj9, invert: invert)
  c4 = chord(key+3+effect, :m9, invert: 1)
  
  mero1 c1, c1, 1, synth
  mero1 c2, c2, 1, synth
  mero1 c1, c1, 1, synth
  mero1 c3, c4, 1, synth
end

# base -----------------


live_loop :base, sync: :met do
  if base_flag < 1 then stop end
  
  base1 :d2
  base1 :d2
  base1 :d2
  base1 :d2
  
  ##| base2 :d2
  ##| base2 :d2
  ##| base2 :d2
  ##| base2 :d2
end



with_fx :reverb, mix: 0.3, room: 0.5 do
  define :base1 do |c|
    use_synth :fm
    a = 1
    with_fx :lpf, cutoff: 90 do
      play c, release: 0.2, amp: a
      sleep 0.375
      play c+7, release: 0.2, amp: a
      sleep 0.375
      play c+12, sustain: 0.2, release: 0, amp: a
      sleep 0.375
      sleep 0.125
      
      play c+7, sustain: 0.125, release: 0, amp: a
      sleep 0.375
      
      play c, sustain: 0.125, release: 0, amp: a
      sleep 0.375
    end
  end
  
  
  define :base2 do |n|
    if base_flag < 1 then stop end
    
    use_synth :fm
    a = 1
    
    play n, sustain: 0.375, release: 0, amp: a
    sleep 0.375
    play n, release: 0.125, sustain: 0, amp: a
    sleep 0.125
    play n+7, release: 0, sustain: 0.25, amp: a
    sleep 0.25
    play n+7, release: 0, sustain: 0.25, amp: a
    sleep 0.25
    
    sleep 0.125
    play n, sustain: 0.375-0.125, release: 0, amp: a
    sleep 0.375-0.125
    play n, release: 0.125, sustain: 0, amp: a
    sleep 0.125
    play n+7, release: 0, sustain: 0.25, amp: a
    sleep 0.25
    play n+7, release: 0, sustain: 0.25, amp: a
    sleep 0.25
    
  end
end


# define------------------------

define :mero1 do |c1, c2, a = 1, synth = :sine|
  use_synth synth
  with_fx :lpf, cutoff: 100 do
    at = 0
    play c1, sustain: 0.125, release: 0, attack: at, amp: a
    sleep 0.25
    play c1, sustain: 0.125*2, release: 0, attack: at, amp: a
    sleep 0.125*2
    
    sleep 0.125
    play c1, sustain: 0.125, release: 0, attack: at, amp: a
    sleep 0.25
    play c1, sustain: 0.125, release: 0, attack: at, amp: a
    sleep 0.125
    
    sleep 0.125
    play c2, sustain: 0.125, release: 0, attack: at, amp: a
    sleep 0.25
    play c2, sustain: 0.125, release: 0, attack: at, amp: a
    sleep 0.125
    
    play c2, sustain: 0.125, release: 0, attack: at, amp: a
    sleep 0.25
    play c2, sustain: 0.125, release: 0, attack: at, amp: a
    sleep 0.25
  end
end

define :mero2 do |c1, c2, a = 1, synth = :saw|
  use_synth synth
  at = 0.01
  with_fx :lpf, cutoff: 100 do
    play c1, sustain: 0.125*3, release: 0, attack: at, amp: a
    sleep 0.5
    play c1, sustain: 0.125*3, release: 0, attack: at, amp: a
    sleep 0.5
    play c2, sustain: 0.125*2, release: 0, attack: at, amp: a
    sleep 0.375
    play c2, sustain: 0.125*2, release: 0, attack: at, amp: a
    sleep 0.375
    sleep 0.25
    
    sleep 0.125
    play c1, sustain: 0.125*2, release: 0, attack: at, amp: a
    sleep 0.375
    play c1, sustain: 0.125, release: 0, attack: at, amp: a
    sleep 0.25
    play c1, sustain: 0.125, release: 0, attack: at, amp: a
    sleep 0.25
    play c2, sustain: 0.25, release: 0, attack: at, amp: a
    sleep 0.375
    play c2, sustain: 0.25, release: 0, attack: at, amp: a
    sleep 0.375
    sleep 0.25
  end
end

define :mero3 do |c1, c2, seed = 0|
  a = 0.4
  at = 0.01 #0.03
  s = 0.125
  use_synth :dpulse
  use_random_seed seed
  
  with_fx :lpf, cutoff: 100 do
    play c1.last, release: 0.125*3, attack: at, amp: a
    sleep 0.5
    play c1.last, release: 0.125*3, attack: at, amp: a
    sleep 0.5
    play c2.last, release: 0.125, attack: at, amp: a
    sleep 0.125
    play c2.choose, release: 0.125*2, attack: at, amp: a
    sleep 0.125*2
    play c2.choose, release: 0.125*3, attack: at, amp: a
    sleep 0.375
    ##| play c1, sustain: 0.125, release: 0, attack: at, amp: a
    sleep 0.25
    
    sleep 0.125
    play c1.last, release: 0.125*2, attack: at, amp: a
    sleep 0.375
    play c1.last, release: 0.125, attack: at, amp: a
    sleep 0.25
    play c1.choose, release: 0.125, attack: at, amp: a
    sleep 0.25
    play c2.choose, release: 0.125, attack: at, amp: a
    sleep 0.125
    play c2.choose, release: 0.125*2, attack: at, amp: a
    sleep 0.125*2
    play c2.choose, release: 0.2, attack: at, amp: a
    sleep 0.375
    sleep 0.25
  end
  
end
