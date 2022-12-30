# output https://twitter.com/ikemura23/status/1594143426576289792

use_bpm 58

clap = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_claps"
hat_loops = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_drum\ loops/LCKK_hat\ loops"
vox = "/Users/k_ikemura/Music/sonic_pi/LCC_CHELL_HOUSE/vox\ loops"


kick_hat_flag = 1
vox_flag = 0
clap_flag = 0

live_loop :met do
  sleep 1
end

with_fx :reverb, room: 0.2 do
  live_loop :kick, sync: :met do
    if kick_hat_flag < 1 then stop end
    ##| sample :bd_tek, rate: 1, amp: 1.3
    sleep 0.5
  end
  
  live_loop :hat, sync: :met do
    if kick_hat_flag < 1 then stop end
    sample hat_loops, 3, beat_stretch: 4, cutoff: 130, amp: 0.7
    sleep 4
  end
  
  live_loop :hat2, sync: :met do
    if kick_hat_flag < 1 then stop end
    sample :drum_cymbal_soft, amp: 0.5, cutoff: 120
    sleep 0.25
  end
  
  live_loop :vox, sync: :met do
    if vox_flag < 1 then stop end
    sleep 0.25
    with_fx :reverb, room: 0.8, mix: 0.5 do
      sample vox, 0, amp: 0.8, start: 0, finish: 0.25 # long
      sleep 2
      sample vox, 0, amp: 0.8, start: 0.4, finish: 0.5 # short
    end
    ##| sleep 0.25
    sleep 4-2-0.25
  end
  
  live_loop :clap, sync: :met do
    if clap_flag < 1 then stop end
    sleep 0.5
    sample clap, 5, amp: 1.1, lpf: 120
    sleep 0.5
  end
end

live_loop :mero, sync: :met do
  stop
  
  a = 3
  use_synth :dsaw
  c1 = chord(:cs3, :m7, invert: 0)
  with_fx :lpf, cutoff: 80 do
    6.times do
      play c1, sustain: 0.2, release: 0, attack: 0.03, amp: a
      sleep 0.375
    end
    
    c2 = chord(:cs3+3, :m7, invert: 0)
    2.times do
      play c2, sustain: 0.2, release: 0, attack: 0.03, amp: a
      sleep 0.375
    end
    
    c3 = chord(:cs3+5, :m7, invert: 0)
    
    2.times do
      play c3, sustain: 0.2, release: 0, attack: 0.03, amp: a
      sleep 0.375
    end
    play c3, sustain: 0.2, release: 0, attack: 0.03, amp: a
    sleep 0.25
  end
end

live_loop :mero2, sync: :met do
  ##| stop
  
  a = 1
  use_synth :dsaw
  key = :cs3
  with_fx :lpf, cutoff: 80 do
    with_fx :wobble, phase: 2, wave: 0, invert_wave: 1 ,mix: 0.2 do
      
      c1 = chord(key, :m7, invert: 0)
      play c1, sustain: 1.75, release: 0, attack: 0.03, amp: a
      sleep 1.75
      
      c2 = chord(key+3, :m7, invert: 0)
      play c2, sustain: 1.5, release: 0, attack: 0.03, amp: a
      sleep 1.5
      
      c3 = chord(key+5, :m7, invert: 0)
      play c3, sustain: 0.75, release: 0, attack: 0.03, amp: a
      sleep 0.75
      
      play c1, sustain: 1.75, release: 0, attack: 0.03, amp: a
      sleep 1.75
      
      play c2, sustain: 1.5, release: 0, attack: 0.03, amp: a
      sleep 1.5
      
      play chord(key-2, :m7, invert: 0), sustain: 0.75, release: 0, attack: 0.03, amp: a
      sleep 0.75
    end
  end
end

live_loop :base, sync: :met do
  stop
  key = :e1
  use_synth :dsaw
  ##| c1 = chord(:cs3, :m7, invert: 0)
  with_fx :reverb, mix: 0.5, room: 0.5, amp: 1.4 do
    with_fx :lpf, cutoff: 90 do
      6.times do
        play key, sustain: 0, release: 0.2
        sleep 0.375
      end
      
      ##| c2 = chord(:cs3+3, :m7, invert: 0)
      3.times do
        play key+3, sustain: 0, release: 0.2
        sleep 0.375
      end
      
      ##| c3 = chord(:cs3+5, :m7, invert: 0)
      ##| 2.times do
      play key-2, sustain: 0, release: 0.2
      sleep 0.375
      ##| end
      play key-2, sustain: 0, release: 0.2
      sleep 0.25
    end
  end
end


live_loop :pico, sync: :met do
  stop
  a = 0.7
  with_fx :reverb, mix: 0.7, room: 0.7 do
    with_fx :wobble, phase: 0.375, wave: 0, mix: 0.4 do
      with_fx :echo, decay: 4, phase: 0.375 do
        
        c = chord(:e4, :m7, invert: [-1,0,1,2,3].choose)
        3.times do
          synth :dpulse, note: c.tick, release: 0.125, amp: a, cutoff: rrand(80, 110)
          sleep 0.25
        end
        sleep 3
        
      end
    end
  end
end
