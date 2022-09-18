use_debug false

mero_flag = 0
mero2_flag = 1
mero3_flag = 0
base_flag = 1
snare_flag = 1
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
    
    ##| sample :bd_sone, amp: a, cutoff: cof
    ##| sleep 0.5
    
    ##| sample :bd_sone, amp: a, cutoff: cof
    ##| sleep 0.5
    
    sample :bd_sone, amp: a, cutoff: cof
    sleep 0.375
    sample :bd_sone, amp: a, cutoff: cof
    sleep 0.125
    
    sample :bd_sone, amp: a, cutoff: cof
    sleep 0.375
    sample :bd_sone, amp: a, cutoff: cof
    sleep 0.125
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
      sample :sn_generic, amp: 0.5, lpf: 100, rate: 1.5
      sleep 0.375
      sample :sn_generic, amp: 0.5, lpf: 100, rate: 1.5
      sleep 0.375
      sample :sn_generic, amp: 0.5, lpf: 100, rate: 1.5
      sleep 0.375
      sleep 0.125
      
      sample :sn_generic, amp: 0.5, lpf: 100, rate: 1.5
      sleep 0.375
      sample :sn_generic, amp: 0.5, lpf: 100, rate: 1.5
      sleep 0.375
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
      sample :drum_cymbal_closed, amp: a, rate: 1, finish: 0.5, pan: p, cutoff: 120 if pattern "x-"
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
    sample :drum_cymbal_open, cutoff: 110, rate: 1, start: 0.01, finish: 0.1, amp: a-0.4, attack: at
    sleep 0.125
    sample :drum_cymbal_open, cutoff: 110, rate: 1, start: 0.01, finish: 0.1, amp: a-0.4, attack: at
    sleep 0.125
  end
end

# mero ---------------------

live_loop :mero, sync: :met do
  if mero_flag < 1 then stop end
  invert = 0
  key=:d3
  
  c1 = chord(key+effect, :m9, invert: invert)
  c2 = chord(key+effect, :m6 , invert: invert)
  
  c3 = chord(key-2+effect, :maj9, invert: invert)
  c4 = chord(key-2+effect, '6', invert: 1)
  
  mero c1, c2
  mero c3, c4
end

define :mero do |c1, c2|
  
  a = 2.5
  at = 0.01 #0.03
  s = 0.125
  use_synth :saw #:sine :saw
  
  with_fx :lpf, cutoff: 120 do
    play c1, sustain: 0.125*3, release: 0, attack: at, amp: a
    sleep 0.5
    play c1, sustain: 0.125*3, release: 0, attack: at, amp: a
    sleep 0.5
    play c2, sustain: 0.125*2, release: 0, attack: at, amp: a
    sleep 0.375
    play c2, sustain: 0.125*2, release: 0, attack: at, amp: a
    sleep 0.375
    ##| play c1, sustain: 0.125, release: 0, attack: at, amp: a
    sleep 0.25
    
    sleep 0.125
    play c1, sustain: 0.125*2, release: 0, attack: at, amp: a
    sleep 0.375
    play c1, sustain: 0.125, release: 0, attack: at, amp: a
    sleep 0.25
    play c1, sustain: 0.125, release: 0, attack: at, amp: a
    sleep 0.25
    play c2, sustain: 0.2, release: 0, attack: at, amp: a
    sleep 0.375
    play c2, sustain: 0.2, release: 0, attack: at, amp: a
    sleep 0.375
    sleep 0.25
  end
end
##| end

# mero2 ---------------------

live_loop :mero2_loop, sync: :met do
  if mero2_flag < 1 then stop end
  
  key = :d4
  synth = :sine #:sine :saw, :piano
  invert = 0
  
  c1 = chord(key+effect,:m9, invert: invert)
  c2 = chord(key+effect, :m6, invert: invert)
  
  c3 = chord(key-2+effect, :maj9, invert: invert)
  c4 = chord(key-2+effect, '6', invert: invert+1)
  
  mero2 c1, c1, synth
  mero2 c2, c2, synth
  
  mero2 c3, c3, synth
  mero2 c4, c4, synth
end

define :mero2 do |c1, c2 , synth=:sine|
  a = 1.3
  use_synth synth
  with_fx :lpf, cutoff: 130 do
    at = 0.01
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

live_loop :mero3, sync: :met do
  if mero3_flag < 1 then stop end
  a = 1
  at = 0.01 #0.03
  s = 0.125
  use_synth :dsaw #:sine :saw
  
  key = :d3+7
  with_fx :wobble do
    with_fx :reverb, mix: 0.5, room: 0.5 do
      with_fx :lpf, cutoff: 90 do
        2.times do
          play key, release: 2, attack: at, amp: a
          sleep 1
          sleep 2
          play key-2, release: 0.5, attack: at, amp: a
          sleep 0.5
          play key-1, release: 0.5, attack: at, amp: a
          sleep 0.5
        end
        
        play key, release: 2, attack: at, amp: a
        sleep 3
        play key+7, release: 1, attack: at, amp: a
        sleep 1
        play key+3, release: 3, attack: at, amp: a
        sleep 4
        
        ##| 2.times do
        ##|   play key-2, release: 0.3, attack: at, amp: a
        ##|   sleep 0.25
        ##|   play key-1, release: 0.3, attack: at, amp: a
        ##|   sleep 0.25
        ##|   play key, release: 0.5, attack: at, amp: a
        ##|   sleep 0.375
        ##| end
        ##| sleep 0.125*2
        
      end
    end
  end
end


# base -----------------

live_loop :base, sync: :met do
  if base_flag < 1 then stop end
  
  base :d2
  base :d2
  
  base :d2-2
  base :d2-2
end


define :base do |n, n2=n|
  with_fx :reverb, mix: 0.3, room: 0.5 do
    
    use_synth :fm
    a = 1
    
    play n, sustain: 0.375, release: 0, amp: a
    sleep 0.375
    play n+7, sustain: 0.125, release: 0, amp: a
    sleep 0.125
    play n+7, sustain: 0.375, release: 0, amp: a
    sleep 0.375
    
    play n+12, sustain: 0.125, release: 0, amp: a
    sleep 0.125
    play n+12, sustain: 0.375, release: 0, amp: a
    sleep 0.375
    
    play n+7, sustain: 0.125, release: 0, amp: a
    sleep 0.125
    play n+7, sustain: 0.375, release: 0, amp: a
    sleep 0.375
    
    play n, sustain: 0.125, release: 0, amp: a
    sleep 0.125
    
    ##| play n, sustain: 0.125, release: 0, amp: a
    ##| sleep 0.125
    
    ##| sleep 0.125
    ##| play n, sustain: 0.125, release: 0, amp: a
    ##| sleep 0.125
    
    ##| sleep 0.125
    ##| play n+12, sustain: 0.375, release: 0, amp: a
    ##| sleep 0.375#-0.125
    ##| play n+7, release: 0.125, sustain: 0, amp: a
    ##| sleep 0.125
    ##| play n+7, release: 0, sustain: 0.25, amp: a
    ##| sleep 0.25
    ##| play n, release: 0, sustain: 0.25, amp: a
    ##| sleep 0.25
    
  end
end
