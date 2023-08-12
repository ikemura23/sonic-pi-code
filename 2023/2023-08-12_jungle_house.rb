# output twitter: https://twitter.com/ikemura23/status/1690366758962798592
# background movie: https://www.youtube.com/watch?v=S9rUAaDd4B4

bass_loop = "/Users/k_ikemura/Music/sonic_pi/LCC_CHELL_HOUSE/bass_loops"
synth_loop = "/Users/k_ikemura/Music/sonic_pi/LCC_CHELL_HOUSE/synth_loops"
vox_loop = "/Users/k_ikemura/Music/sonic_pi/LCC_CHELL_HOUSE/vox loops"

use_debug false
use_bpm 64

kick_play = 1

hat_close_play = 1
hat_open_play = 1
snare_play = 1

bass_play = 1

synth_sample_play = 0

vox1_play = 0
vox2_play = 0

######################

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
  
  live_loop :fuzz_tom, sync: :met do
    ##| stop
    use_sample_defaults lpf: 80, amp: 0.7, finish: 0.12
    
    sample :glitch_perc1, rate: 0.7
    sample :glitch_perc1, rate: 0.5
    sleep 0.5
    sample :glitch_perc1, rate: 0.5
    sleep 0.5
    
  end
  
  live_loop :safari, sync: :met do
    stop
    sample :loop_safari, beat_stretch: 8, amp: 0.5
    sleep 8
  end
  
  live_loop :soft_kick, sync: :met do
    ##| stop
    use_sample_defaults rate: 0.3, lpf: 110, attack: 0.009, amp: 0.8
    
    sample :elec_bong
    sleep 0.375
    sample :elec_bong
    sleep 0.125
    
    6.times do
      sample :elec_bong, rate: [0.45,0.3].tick
      sleep 0.25
    end
  end
  
  live_loop :elec_pop, sync: :met do
    stop
    use_sample_defaults rate: 3, lpf: 80, amp: 0.7
    sleep 0.375+0.125
    
    12.times do
      sleep 0.125
      sample :elec_pop
    end
  end
  
  live_loop :tabla, sync: :met do
    ##| stop
    use_sample_defaults amp: 0.3, lpf: 130
    
    sample :tabla_ghe3
    sleep 0.125
    sample :tabla_tas2, rate: 0.7
    sleep 0.25
    sample :tabla_tas2, rate: 0.7
    sleep 0.125
    
    sample :tabla_tas2, rate: 0.7
    sleep 0.25
    sample :tabla_tas2, rate: 0.7
    sleep 0.25
  end
  
  live_loop :tabla_tas, sync: :met do
    ##| stop
    use_sample_defaults amp: 0.4, lpf: 130
    
    ##| sample :tabla_ke2
    sleep 0.125*3
    sample :tabla_ke3
    sleep 0.125
    sample :tabla_ke3
    sleep 0.25
    sample :tabla_ke3
    sleep 0.25
  end
end


########

num = 3 #2 3 5 13 17

live_loop :bass, sync: :met do
  ##| stop
  if bass_play < 1 then stop end
  sample bass_loop, num ,beat_stretch: 8, amp: 1.2
  sleep 8
  
end

live_loop :synth_sample, sync: :met do
  ##| stop
  if synth_sample_play < 1 then stop end
  use_sample_defaults beat_stretch: 8, amp: 0.4, finish: 0.25#, lpf: 100
  
  ##| sleep 4
  r= 0.3
  with_fx :reverb, mix: r, room: r do
    sample synth_loop, num
    sleep 2
    
    ##| sample synth_loop, num
    ##| sleep 2
  end
end

live_loop :vox1, sync: :met do
  ##| stop
  if vox1_play < 1 then stop end
  vox1_num = 5 #1 4 5
  sleep 4
  sample vox_loop, vox1_num ,beat_stretch: 4, amp: 0.6
  sleep 4
  
end

live_loop :vox2, sync: :met do
  if vox2_play < 1 then stop end
  vox1_num2 = 8 #1 4 5
  sample vox_loop, vox1_num2 ,beat_stretch: 4, amp: 0.7
  sleep 4
end
