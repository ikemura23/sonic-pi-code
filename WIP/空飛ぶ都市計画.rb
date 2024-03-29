# https://www.youtube.com/watch?v=ZezfpWmfacc

use_bpm 62

claps = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_claps"




sample :vinyl_backspin, rate: 1
sleep 1

play_a



# Aメロ
define :play_a do
  in_thread do
    2.times do
      synth_a
    end
  end
  
  in_thread do
    4.times do
      4.times do
        4.times do
          cymbal_open
        end
      end
    end
  end
  
  in_thread do
    4.times do
      4.times do
        8.times do
          hat_close
        end
      end
    end
  end
  
  in_thread do
    4.times do
      4.times do
        ##| 2.times do
        tabla
        ##| end
      end
    end
  end
  
  in_thread do
    4.times do
      4.times do
        2.times do
          clap
        end
      end
    end
  end
end



define :kick do
  a = 1
  
  sample :bd_tek, amp: a, lpf: 110
  sleep 0.5
end

with_fx :reverb, mix: 0.2 do
  
  define :cymbal_open do
    ##| stop
    ##| if drum_hat_clap < 1 then stop end
    use_sample_defaults lpf: 130, amp: 0.1
    sleep 0.25
    
    with_fx :distortion, mix: 0.2 do
      sample :drum_cymbal_open,  beat_stretch: 1.8, finish: 0.125, hpf: 90
    end
    
    sleep 0.25
  end
  
  # clap
  define :clap do
    
    sleep 0.5
    ##| with_fx :reverb, mix: 0.4 do
    sample claps, 0, amp: 1, lpf: 120, rate: 0.8
    ##| end
    sleep 0.5
  end
end

define :hat_close do
  use_sample_defaults lpf: 120, amp: 0.5
  sample :hat_bdu
  sleep 0.25
end

define :tabla do
  use_sample_defaults lpf: 130, amp: 0.5
  sample :tabla_tas1
  sleep 0.25
  sample :tabla_na_s
  sleep 0.25
  
  sleep 0.25
  
  sample :tabla_tas1
  sleep 0.25
  sample :tabla_tas1
  sleep 0.25
  sample :tabla_na_s
  sleep 0.25
  sleep 0.25
  sample :tabla_tas1
  sleep 0.25
end


define :synth_a do
  
  use_synth_defaults release: 0, sustain: 0.24, amp: 1
  use_synth :dsaw
  
  tonic = :ab3
  name = :M7
  
  3.times do |i|
    play chord(tonic, name)
    sleep 0.5
    
    play chord(tonic, name)
    sleep 0.5
    
    play chord(tonic, name)
    sleep 0.5
    
    sleep 0.25
    
    play chord(tonic, name)
    sleep 0.5
    
    play chord(tonic, name)
    sleep 0.5
    
    play chord(tonic-1, :m7)
    sleep 0.25
    play chord(tonic, name)
    sleep 0.25
    sleep 0.25
    
    case i
    when 0, 2
      play chord(tonic-1, :m7), sustain: 0.5
      sleep 0.5
    else
      play chord(:bs3, :m7, invert: 0), sustain: 0.5
      sleep 0.5
    end
  end
  
  play chord(tonic, name)
  sleep 0.5
  
  play chord(tonic, name)
  sleep 0.5
  
  play chord(tonic, name)
  sleep 0.5
  sleep 0.5
  
  play chord(:f3, :m7), sustain: 1
  sleep 1
  sleep 0.25
  
  play chord(tonic+12, name), sustain: 1-0.25
  sleep 1-0.25
end
