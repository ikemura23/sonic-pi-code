#output https://twitter.com/ikemura23/status/1535993971272712192

clap = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_claps"
hatLoop="/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_drum\ loops/LCKK_hat\ loops"

use_debug false
use_bpm 67

live_loop :hatLoop, sync: :bd do
  sample hatLoop, 15, beat_stretch: 4, amp: 1.5, lpf: 120 # 4
  sleep 4
end

with_fx :reverb do
  live_loop :bd do
    sleep 0.5
    sample :bd_tek, cutoff: 100, amp: 1.2
  end
  
  
  live_loop :cymbal , sync: :bd do
    sleep 0.25
    sample :drum_cymbal_closed, amp: [1, 0.5].tick, cutoff: 120
  end
  
  live_loop :cymbal_open, sync: :bd do
    sleep 0.25
    ##| sample :drum_cymbal_open, amp: 0.4, beat_stretch: 2, finish: 0.1, hpf: 100
    sleep 0.25
  end
  
  live_loop :clap, sync: :bd do
    use_random_seed 200
    [clap_single,
     clap_single,
     clap_single,
     clap_single,
     clap_double,
     clap_double,
     clap_double,
     clap_double2
     ].choose
  end
  
  define :clap_single do | amp = 1, lpf = 130 |
    sleep 0.5
    with_fx :reverb do
      sample clap, 1, amp: amp, lpf: lpf
    end
    sleep 0.5
  end
  
  define :clap_double do
    num = 1
    
    sleep 0.5
    with_fx :reverb do
      
      sample clap,num, amp: 1
      
      sleep 0.375
      sample clap,num, amp: 1
    end
    sleep 1-0.5-0.375
  end
  
  define :clap_double2 do
    num = 1
    
    sleep 0.5
    with_fx :reverb do
      sleep 0.375
      sample clap,num, amp: 1
      
      sleep 0.375
      sample clap,num, amp: 1
    end
    sleep 1-0.5-0.75
  end
  
end



live_loop :strings_loop, sync: :bd do
  cd :g3, :madd4
  cd :g3, :madd4
  cd :g3+1, :m7
  cd :g3+3, :m7
  
  
  ##| strings :g3, :m9
  ##| strings :g3-5, :m9
  ##| strings :g3-2, :m9
  ##| strings :g3-2, :m9
end


live_loop :base_loop, sync: :bd do
  
  base :g1
  base :g1
  base :g1+1
  base :g1+3
  
  
  ##| base :g1
  ##| base :g2
  ##| base :g1-5
  ##| base :g2-5
  ##| base :g1-2
  ##| base :g2-2
  ##| base :g1-2
  ##| base :g2-2
end

##| live_loop :strings_loop2, sync: :bd do
##|   sleep 8
##|   strings2 :g3-2, :m9, 1
##| end



with_fx :reverb do
  
  define :base do |key|
    use_synth :dpulse
    
    cd = chord_invert(chord(key, :minor),0)
    sleep 1.25
    3.times do
      play cd.tick, release: 0.2
      sleep 0.125
    end
    play key+12, release: 0.3
    sleep 0.75-0.125*3
  end
  
  define :cd do | tonic, name |
    use_synth :supersaw
    
    cd = chord(tonic+7, name)
    play cd, sustain: 1.5, release: 0, amp: 0.9, cutoff: 100
    sleep 2
  end
  
  define :strings do | tonic, name|
    use_synth :dtri
    
    play chord(tonic, name), sustain: 4, release: 0, attack: 0, amp: 1
    play chord(tonic-7, name), sustain: 4, release: 0, attack: 0, amp: 0.5
    sleep 4
  end
  
  define :strings2 do | tonic, name, amp=1|
    use_synth :saw
    with_fx :wobble, wave: 0, phase: 8, invert_wave: 0, amp: amp do
      play chord(tonic, name), sustain: 3, release: 1, amp: 0.5, attack: 4
      play chord(tonic+7, name), sustain: 3, release: 1, amp: 0.5, attack: 4
      sleep 8
    end
  end
  
end