
use_debug false
use_bpm 63

clap = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_claps"
hat = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_hats"
percussion = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_drum\ loops/LCKK_percussion\ loops"


mero_flag = 1

base_flag = 1
base2_flag = 0

kick_hat_frag = 1
cymbal_open_flag = 0
splash2_flag = 1


live_loop :met do
  sleep 1
end

# drum -------------------

define :pattern do |pattern|
  return pattern.ring.tick == "x"
end

live_loop :percussion, sync: :met do
  ##| sample percussion, 6, amp: 0.7, beat_stretch: 4 #, start: 0, finish: 0.5 #2, 3 4 6
  sleep 2
end

live_loop :kick, sync: :met do
  if kick_hat_frag < 1 then stop end
  a = 1.5
  
  28.times do
    sample :bd_tek, rate: 0.9, amp: a, cutoff: 130
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

live_loop :splash2, sync: :met do
  if splash2_flag < 1 then stop end
  sleep 14
  16.times do
    sample :drum_splash_hard, beat_stretch: 1 if pattern "--x-x-x-xxxxxxxx"
    sleep 0.125
  end
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
      ##| p = [-0.3, 0.3].choose
      sample hat, 9, amp: 0.2, rate: 1.5 if pattern "-x-x"
      sleep 0.25
      sample hat, 9, amp: 0.5, rate: 1.5 if pattern "-x-x"
      sleep 0.25
    end
  end
end

with_fx :hpf, cutoff: 100 do
  live_loop :hh2, sync: :met do
    if cymbal_open_flag < 1 then stop end
    a = 0.8
    at = 0
    sleep 0.25
    sample :drum_cymbal_open, cutoff: 110, rate: 1, start: 0.01, finish: 0.2, amp: a, attack: at
    sleep 0.25
  end
end
# base -----------------

live_loop :base, sync: :met do
  if base_flag < 1 then stop end
  
  base :f2
  
end

live_loop :base2, sync: :met do
  if base2_flag < 1 then stop end
  
  base2 :f2
end

define :base do |c|
  with_fx :reverb, mix: 0.3, room: 0.5 do
    
    use_synth :fm
    a = 1
    with_fx :lpf, cutoff: 120 do
      
      play c, sustain: 0.125, release: 0, amp: a
      sleep 0.125
      play c-1, sustain: 0.125, release: 0, amp: a
      sleep 0.125
      play c, sustain: 0.125, release: 0, amp: a
      sleep 0.125
      play c-1, sustain: 0.125, release: 0, amp: a
      sleep 0.125
      play c, sustain: 0.125, release: 0, amp: a
      sleep 0.125
      play c+12, sustain: 0.2, release: 0.125, amp: a
      sleep 0.25
      
      play c, sustain: 0.125, release: 0.1, amp: a
      sleep 0.125
      ##| play c, sustain: 0.125, release: 0, amp: a
      sleep 0.125
      play c, sustain: 0.125, release: 0, amp: a
      sleep 0.125
      play c+9, sustain: 0.125, release: 0, amp: a
      sleep 0.125
      play c+8, sustain: 0.125, release: 0, amp: a
      sleep 0.125
      
      play c, sustain: 0.125, release: 0, amp: a
      sleep 0.125
      play c, sustain: 0.125, release: 0, amp: a
      sleep 0.125
      play c+9, sustain: 0.125, release: 0, amp: a
      sleep 0.125
      play c+5, sustain: 0.125, release: 0, amp: a
      sleep 0.125
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
    
    play c+5, release: 0.12, amp: a
    sleep 0.375
  end
end

with_fx :reverb, mix: 0.5, room: 0.5 do
  live_loop :mero, sync: :met do
    if mero_flag < 1 then stop end
    c = chord(:f3, '+5')
    a = 0.7
    use_synth :dpulse
    
    with_fx :bpf, cutoff: 130 do
      at = 0.05
      play c, sustain: 0.1, release: 0.1, amp: a
      sleep 0.25
      play c, sustain: 0.1, release: 0.1, amp: a
      sleep 0.25
      play c, sustain: 0.1, release: 0.1, amp: a
      sleep 0.25
      sleep 4-0.25*3
    end
  end
end

