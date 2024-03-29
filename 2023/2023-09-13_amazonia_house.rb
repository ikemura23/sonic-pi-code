# output twitter: https://twitter.com/ikemura23/status/1702920577353437599
# background movie: https://youtu.be/S9rUAaDd4B4?si=vipm484u8wUG_HMI

bass_loop = "/Users/k_ikemura/Music/sonic_pi/LCC_CHELL_HOUSE/bass_loops"
synth_loop = "/Users/k_ikemura/Music/sonic_pi/LCC_CHELL_HOUSE/synth_loops"

use_debug false
use_bpm 64

kick_play = 1

hat_close_play = 0
hat_open_play = 0
snare_play = 1

elec_pop_play = 0

bass_play = 0

voice1_play = 1
voice2_play = 0

voice_patern = 1 # 1 or 2

synth_sample_play = 0

# metronome #####################

live_loop :met do
  sleep 1
end

## drum ######################

with_fx :reverb, room: 0.3 do
  live_loop :kick, sync: :met do
    if kick_play < 1 then stop end
    
    a = 1.2
    
    sample :bd_tek, rate: 0.9, amp: a, lpf: 130
    sleep 0.5
  end
  
  live_loop :hat1, sync: :met do
    if hat_close_play < 1 then stop end
    
    use_sample_defaults rate: 1.2, lpf: 110, attack: 0.01
    
    sample :drum_cymbal_closed, amp: 1
    sleep 0.125
    3.times do
      sample :drum_cymbal_closed, amp: 0.5
      sleep 0.125
    end
  end
  
  live_loop :cymbal_open, sync: :met do
    if hat_open_play < 1 then stop end
    sleep 0.25
    sample :drum_cymbal_open, amp: 0.17, beat_stretch: 1.7, finish: 0.16, lpf: 125, rate: 1.2
    sleep 0.25
  end
  
  live_loop :snare_loop, sync: :met do
    
    if snare_play < 1 then stop end
    
    r=2
    use_sample_defaults amp: 1, cutoff: 100, rate: r
    
    sleep 0.5
    
    sample :sn_generic, rate: r+1
    sample :sn_generic, start: 0.02, pan: 0.2
    
    sleep 0.5
  end
  
  live_loop :glitch_perc, sync: :met do
    ##| stop
    use_sample_defaults lpf: 80, amp: 0.9, finish: 0.12
    
    sample :glitch_perc1, rate: 0.7
    sample :glitch_perc1, rate: 0.5
    sleep 2
  end
  
  live_loop :safari, sync: :met do
    ##| stop
    sample :loop_safari, beat_stretch: 8, amp: 0.8
    sleep 8
  end
  
  live_loop :elec_pop, sync: :met do
    ##| stop
    if elec_pop_play < 1 then stop end
    use_sample_defaults rate: 3, lpf: 70, amp: 0.7
    sleep 0.375+0.125
    
    12.times do
      sleep 0.125
      sample :elec_pop
    end
  end
  
  live_loop :tabla_ke, sync: :met do
    ##| stop
    use_sample_defaults amp: 0.7, lpf: 130
    
    sample :tabla_ghe3
    sleep 0.125
    sample :tabla_ke1, rate: 0.7
    sleep 0.25
    sample :tabla_ke1, rate: 0.7
    sleep 0.125
    
    sample :tabla_ke1, rate: 0.7
    sleep 0.25
    sample :tabla_ke1, rate: 0.7
    sleep 0.25
  end
  
  live_loop :tabla_tas, sync: :met do
    ##| stop
    use_sample_defaults amp: 0.6, lpf: 130
    
    sample :tabla_tas2
    sleep 0.25
    ##| sample :tabla_te2
    sleep 0.25
    sample :tabla_tas1
    sleep 0.25
    sample :tabla_tas1
    sleep 0.25
  end
end

# bass ################## bass

num = 13 #2 3 5 13 17

live_loop :bass, sync: :met do
  if bass_play < 1 then stop end
  sample bass_loop, num ,beat_stretch: 8, amp: 1.5, finish: 0.5
  sleep 4
  
end

# synth ###################

synth_num = 8 # 8 9 10 13 14 15 3 2

live_loop :synth_sample, sync: :met do
  ##| stop
  if synth_sample_play < 1 then stop end
  use_sample_defaults beat_stretch: 8, amp: 0.5, finish: 0.125#, lpf: 100
  
  ##| sleep 4
  r= 0.3
  with_fx :reverb, mix: r, room: r do
    sleep 1
    sample synth_loop, synth_num
    sleep 1
    
  end
end


# voice ###################

live_loop :sample_crow, sync: :met do
  
  if voice1_play < 1 then stop end
  
  use_sample_defaults  amp: 0.6, finish: 0.17, cutoff: 100, rate: 0.75#-0.15
  
  with_fx :reverb do
    
    if voice_patern > 1 then
      sample :misc_crow
      sleep 1
      
      sleep 0.125
      sample :misc_crow
      sleep 0.125
      sleep 1-0.125*2
      
      sample :misc_crow
      sleep 1
      
      sample :misc_crow
      sleep 0.125
      sample :misc_crow
      sleep 0.125
      sleep 0.125
      sleep 0.125
      sleep 0.125
      sample :misc_crow
      sleep 0.125
      sleep 0.125
      ##| sample :misc_crow
      sleep 0.125
      
    else
      2.times do
        sleep 0.75
        sample :misc_crow
        sleep 1-0.75
        
        sleep 0.75
        sample :misc_crow
        sleep 1-0.75
      end
    end
  end
end

live_loop :sample_voice, sync: :met do
  if voice2_play < 1 then stop end
  
  use_sample_defaults  amp: 0.5,  start: 0.14, finish: 0.19, rate: 1.15
  
  with_fx :reverb do
    
    if voice_patern > 1 then
      2.times do
        sleep 0.375
        sample :loop_weirdo
        sleep 0.375
        sample :loop_weirdo
        sleep 1-0.375*2
      end
    else
      sample :loop_weirdo
      sleep 0.375
      sample :loop_weirdo
      sleep 0.375
      sleep 1-0.375*2
      
      sample :loop_weirdo
      sleep 0.375
      sample :loop_weirdo
      sleep 0.375
      sleep 1-0.375*2
      
      sleep 0.125
      sample :loop_weirdo
      sleep 0.25
      sample :loop_weirdo
      sleep 0.375
      sleep 1-0.375*2
      
      sleep 0.375
      sample :loop_weirdo
      sleep 0.375
      sleep 1-0.375*2
    end
  end
end
