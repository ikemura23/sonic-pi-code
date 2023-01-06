
use_debug false
use_bpm 76

clap = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_claps"
hat = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_hats"
synth_loop = "/Users/k_ikemura/Music/sonic_pi/LCC_CHELL_HOUSE/synth_loops"
top_loop = "/Users/k_ikemura/Music/sonic_pi/LCA_LIQUID_DNB/LCA_drum\ loops/LCA_top\ loops"
kick_sample = "/Users/k_ikemura/Music/sonic_pi/LCA_LIQUID_DNB/LCA_one\ shots/LCA_kicks"
drum_full_loop = "/Users/k_ikemura/Music/sonic_pi/LCA_LIQUID_DNB/LCA_drum\ loops/LCA_drum\ loops\ full"

kick_flag = 1
hat_flag = 1
top_loop_flag = 1

##| clap_flag = 0
clap2_flag = 0

mero1_flag = 1
mero2_flag = 0

live_loop :met do
  sleep 1
end

with_fx :reverb, room: 0.3 do
  live_loop :kick, sync: :met do
    if kick_flag < 1 then stop end
    ##| sample :bd_tek, amp: 1.4#, cutoff: 90
    sample kick_sample, 0,rate: 0.8
    sleep 0.5
  end
  
  live_loop :top_loop, sync: :met do
    if top_loop_flag < 1 then stop end
    ##| with_fx :bpf, centre: 100 do
    sample drum_full_loop, 3, beat_stretch: 8, amp: 1.1, cutoff: 120
    sleep 8
    ##| end
  end
  
  
  live_loop :hhc1, sync: :met do
    if hat_flag < 1 then stop end
    sleep 0.25
    sample hat, 15, amp: 0.5#, rate: 1.5
    sleep 0.25
    
  end
  
  live_loop :hhc2, sync: :met do
    if hat_flag < 1 then stop end
    
    sample hat, 15, amp: 0.5, rate: 1.5
    sleep 0.125
    
    sleep 0.125
    2.times do
      sample hat, 14, amp: 0.5, rate: 1.5
      sleep 0.125
    end
  end
  
  
  ##| live_loop :clap, sync: :met do
  ##|   if clap_flag < 1 then stop end
  
  ##|   sleep 0.5
  ##|   sample clap, 1, amp: 0.8, lpf: 120, rate: 0.8
  ##|   sleep 0.5
  ##| end
  
  
  live_loop :clap2, sync: :met do
    if clap2_flag < 1 then stop end
    
    sleep 0.125
    3.times do
      sample clap, 2, amp: 0.8, cutoff: 120, rate: 1.5
      sleep 0.125
    end
    
  end
end


live_loop :mero1, sync: :met do
  if mero1_flag < 1 then stop end
  use_synth :winwood_lead
  cd = chord(:e4, :m9, invert: 2).shuffle
  sleep 0.25
  with_fx :reverb, room: 0.5, mix: 0.7 do
    
    cd.size.times do
      play cd.tick, release: 2, cutoff: 130, amp: 0.9
      sleep 0.75
    end
    ##| end
  end
  
  sleep 4-0.75*cd.size-0.25
end

live_loop :mero2, sync: :met do
  if mero2_flag < 1 then stop end
  
  use_synth :winwood_lead
  cd = chord(:e4+6, :m9).shuffle
  sleep 2
  with_fx :reverb, room: 0.5, mix: 0.7 do
    tick_reset
    
    ##| with_fx :bpf, centre: 110 do
    3.times do
      play cd.tick, release: 2, cutoff: 130, amp: 1
      play cd.tick-2, release: 2, cutoff: 130, amp: 1
      sleep 0.75
    end
  end
  ##| end
  sleep  4-0.75*3-2
end

live_loop :mero3, sync: :met do
  use_random_seed 4008
  
  sl = [0.5,0.375,0.125, 0.25,0.375, 0.25, 0.375,
        0.125,0.25, 0.375, 0.375, 0.25, 0.375].shuffle
  
  ef = [0,0,0,0,0,0,0,-5,-5,-5,-5,-5,
        3,3,3,3,3,3,5,5,5,5,5,5,5,5].ring
  
  ##| ef = [0,0,0,0,-5,-5,3,3,3,5,5,5,5].ring
  
  ##| ef = [0,0,0,0,1,1,2,2,2,4,4,4,4].shuffle
  
  with_fx :reverb, mix: 0.6, room: 0.6 do
    
    sl.size.times do
      n = :e3
      _release = 0.2
      
      c = chord(n+ef.tick("ef"), :m9, invert: 3)
      with_fx :wobble, phase: 0.25, mix: 0.3, invert_wave: 0, amp: 0.9 do
        
        # :square, :dsaw
        synth :square, note: chord(n+ef.look("ef"), :m9, invert: 0), release: _release, amp: 0.6
        synth :saw, note: chord(n+ef.look("ef"), :m9, invert: -2), release: _release, amp: 0.7
        
        with_fx :bitcrusher do
          chord(n+ef.look("ef")+7, :m9, invert: 2)
          synth :dpulse, note: c, release: _release, amp: 1 #:beep :dpulse
        end
        
        synth :dsaw, note: n+ef.look("ef")-24, release: _release, amp: 1
      end
      sleep sl.tick("sl")
      
    end
  end
end
