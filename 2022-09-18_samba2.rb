use_debug false

mero_flag = 1
base_flag = 1
snare_flag = 1
cymbal_open_flat = 0
cowbel_flag = 0

effect = 0

live_loop :met do
  sleep 1
end

# drum -------------------

define :pattern do |pattern|
  return pattern.ring.tick == "x"
end

live_loop :kick, sync: :met do
  ##| stop
  a = 1.5
  cof = 90
  
  14.times do
    
    sample :bd_sone, amp: a, cutoff: cof
    sleep 0.5
    
    sample :bd_sone, amp: a, cutoff: cof
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

with_fx :echo, mix: 0.2 do
  with_fx :reverb, mix: 0.5, room: 0.5 do
    live_loop :snare, sync: :met do
      if snare_flag < 1 then stop end
      
      sample :drum_snare_soft, amp: 0.8, lpf: 110, rate: 1 if pattern "x--x--x---x--x--"
      sleep 0.125
      
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
      ##| stop
      a = 0.5
      p = [-0.3, 0.3].choose
      sample :drum_cymbal_closed, amp: a, rate: 1, finish: 0.5, pan: p, cutoff: 120 if pattern "x-xx"
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
    sleep 0.25
    sample :drum_cymbal_open, cutoff: 110, rate: 1, start: 0.01, finish: 0.1, amp: a-0.4, attack: at
    sleep 0.125
    sample :drum_cymbal_open, cutoff: 110, rate: 1, start: 0.01, finish: 0.1, amp: a-0.4, attack: at
    sleep 0.125
  end
end

# mero ---------------------

live_loop :mero_loop, sync: :met do
  key = :d3
  
  mero1 chord(key,:m9, invert: 0)
  sleep 2
  mero1 chord(key-2, :m9, invert: 1)
  sleep 2
  
  ##| mero2 chord(key+4,:m9, invert: 1), :sine, 1
  ##| mero2 chord(key+4,:m9, invert: 5), :sine, 1
  
  ##| mero2 chord(key,:m9, invert: 0), :sine,4
  ##| mero2 chord(key-2,:m9, invert: 1), :sine,2
  ##| mero2 chord(key+4,:m9, invert: 1), :sine, 1
  ##| mero2 chord(key+4,:m9, invert: 5), :sine, 1
end

with_fx :reverb, mix: 0.3, room: 0.4 do
  define :mero1 do |c,sl=2, synth=:sine|
    if mero_flag < 1 then stop end
    
    a = 1.6
    use_synth synth
    
    with_fx :lpf, cutoff: 100 do
      
      at = 0.01
      play c, sustain: 0.125, release: 0, attack: at, amp: a
      sleep 0.375
      play c, sustain: 0.125, release: 0, attack: at, amp: a
      sleep 0.375
      play c, sustain: 0.5, release: 0, attack: at, amp: a
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
end

# base -----------------

live_loop :base, sync: :met do
  if base_flag < 1 then stop end
  
  base :d2
  base :d2
  
  base :d2-2
  base :d2+4
end


define :base do |c|
  with_fx :reverb, mix: 0.3, room: 0.5 do
    
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
end
