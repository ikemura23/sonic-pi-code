use_debug false
use_bpm 62

clap = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_claps"
hat = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_hats"
hat_loops = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_drum\ loops/LCKK_hat\ loops"


kick_hat_flag = 1
kick_hat_loop_flag = 1

clap_flag = 1

mero1_flag = 1
mero2_flag = 0
mero3_flag = 0

bass_flag = 1

live_loop :met do
  sleep 1
end

with_fx :reverb, room: 0.2 do
  live_loop :kick, sync: :met do
    if kick_hat_flag < 1 then stop end
    sample :bd_tek, amp: 1.2
    ##| sample :bd_ada, amp: 1.2
    sleep 0.5
  end
  
  
  live_loop :hat, sync: :met do
    if kick_hat_loop_flag < 1 then stop end
    
    sleep 0.25
    ##| sample hat, 1, cutoff: 120, amp: 1
    sleep 0.25
  end
  
  live_loop :hat_loop, sync: :met do
    if kick_hat_loop_flag < 1 then stop end
    sample hat_loops, 0, beat_stretch: 4, cutoff: 120, amp: 0.9
    sleep 4
  end
  
  live_loop :clap, sync: :met do
    if clap_flag < 1 then stop end
    sleep 0.5
    sample clap, 5, amp: 1.3, lpf: 120
    sleep 0.5
  end
end

live_loop :base, sync: :met do
  if bass_flag < 1 then stop end
  
  use_random_seed 9230 #9230 9233
  sl = [0.25, 0.25, 0.25, 0.25, 0.375].shuffle
  
  c = chord(:e1, :sus4, invert: -1)
  with_fx :reverb, mix: 0.5, room: 0.5, amp: 1.5 do
    with_fx :lpf, cutoff: 80 do
      sl.size.times do
        
        synth :dsaw, note: c.choose, sustain: 0.125, release: 0
        sleep sl.tick
      end
      
      sleep 2-sl.sum-0.25
      synth :dsaw, note: c.choose, sustain: 0.125, release: 0
      sleep 0.125
      synth :dsaw, note: c.choose, sustain: 0.125, release: 0
      sleep 0.125
    end
  end
end

# mero ---------------

live_loop :mero1, sync: :met do
  if mero1_flag < 1 then stop end
  
  with_fx :reverb, mix: 0.5, room: 0.8 do
    with_fx :wobble, phase: 0.125, wave: 0, mix: 0.7 do
      ##| sleep 1
      sleep 0.75
      c = chord(:e4-7, :sus4, invert: [-1,0,0,1,2].choose)
      synth :dsaw, note: c, release: 0.25, amp: 1.4, cutoff: rrand(70, 90)
    end
    sleep 0.25
    sleep 0.375
    
    with_fx :wobble, phase: 0.125, wave: 0, mix: 0.5 do
      c = chord(:e5, :sus2, invert: [0,1,2].choose)
      ##| synth :dpulse, note: c, release: 0.25, amp: 1.2, cutoff: rrand(40, 60)
      sleep 2-0.75-0.25-0.375
    end
  end
end


live_loop :mero2, sync: :met do
  if mero2_flag < 1 then stop end
  synth :hollow, note: chord(:e2+7, :sus4, invert: 3), release: 0, sustain: 8, amp: 2.5
  sleep 8
end


live_loop :mero3, sync: :met do
  if mero3_flag < 1 then stop end
  
  with_fx :reverb, room: 0.5, mix: 0.5 do
    with_fx :slicer, phase: 0.5, mix: 0.1 do
      synth :mod_tri, note: chord(:e4+[0,2,-5].choose, :sus4, invert: -2), release: 3, sustain: 0, cutoff: 110, amp: 0.6, attack: 0.25
    end
  end
  sleep 6
end

live_loop :ambient, sync: :met do
  stop
  sleep 0.5
  with_fx :reverb, mix: 0.7, room: 0.7 do
    with_fx :slicer, phase: 0.5 do
      sample :ambi_sauna, start: 0.125, finish: 0.9, attack: 0.125, beat_stretch: 8
      sleep 8-0.5
    end
  end
end
