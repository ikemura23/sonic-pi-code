# Inspired by 
#   https://youtu.be/c8zaWGKQK34?si=AB51xcppxnCDtiai
#   https://youtu.be/Urok9ZCj0Cs?si=qY3haWgA4ypgX6zS

clap = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_claps"

duration = 8

live_loop :met do
  sleep 0.5
end

with_fx :distortion, amp: 1 do
  with_fx :reverb do
    
    live_loop :kick, sync: :met do
      ##| stop
      
      sample :bd_fat, # :bd_tek :bd_sone :bd_fat
        amp: 1, lpf: 110
      sleep 0.5
    end
    
    
    live_loop :hat, sync: :met do
      ##| stop
      use_sample_defaults cutoff: 100, amp: 1.2
      
      3.times do
        sleep 0.25
        sample :hat_raw
        sleep 0.25
      end
      
      sleep 0.25
      sample :hat_raw
      sleep 0.125
      
      sample :hat_raw
      sleep 0.125
    end
    
    live_loop :hat2, sync: :met do
      ##| stop
      use_sample_defaults cutoff: 100, amp: 0.8
      
      sleep 1
      sample :hat_bdu
      sleep 1
    end
    
    live_loop :snare_loop, sync: :met do
      ##| stop
      with_fx :lpf, cutoff: 90 do
        sleep 0.5
        
        sample clap, 0
        
        sleep 0.5
      end
    end
  end
  
  live_loop :ambient_1, sync: :met do
    with_fx :lpf, cutoff: rrand(70, 80) do
      with_fx :reverb, room: 0.8, mix: 0.7 do
        
        sleep duration-0.5
        sample :elec_lo_snare, amp: 0.5, rate: rrand(1.1, 1.3)
        sample :ambi_sauna, beat_stretch: 2, rate: 0.9, start: 0.2, finish: 0.4, amp: 1
        sleep 0.5
        
      end
    end
  end
  
end



live_loop :synth1, sync: :met do
  ##| stop
  use_synth_defaults sustain: duration-0.7, release: 0, attack: 0.2, amp: 2
  use_synth :hollow
  with_fx :reverb do
    
    play chord(:d3, :M7, invert: 2)
    sleep duration
    
    play chord(:a2, :M7, invert: 4)
    sleep duration
    
    play chord(:d3, :M7, invert: 2)
    sleep duration
    
    play  chord(:cs3, :m, invert: 2)
    sleep duration
    ##| end
  end
end

live_loop :synth2, sync: :met do
  ##| stop
  
  use_synth_defaults release: duration-0.7, attack: 0.5, amp: 0.5, cutoff: 80
  use_synth :saw
  with_fx :reverb do
    with_fx :distortion, amp: 1 do
      play chord(:d3, :M7, invert: 0)
      sleep duration
      
      play chord(:a2, :M7, invert: 2)
      sleep duration
      
      play chord(:d3, :M7, invert: 0)
      sleep duration
      
      play chord(:cs3, :m, invert: 0)
      sleep duration
    end
  end
end


live_loop :bass, sync: :met do
  ##| stop
  use_synth_defaults release: 0.3, amp: 1.7, cutoff: 70
  use_synth :dpulse
  
  keys = [:d2,:a1, :d2, :cs2]
  
  4.times do
    key = keys.tick
    4.times do
      sleep 0.75
      play key
      sleep 2-0.75
      
    end
  end
end
