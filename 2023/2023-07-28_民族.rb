# original: https://youtu.be/qAbNwhioKv4
bass_loop = "/Users/k_ikemura/Music/sonic_pi/LCC_CHELL_HOUSE/bass_loops"
synth_loop = "/Users/k_ikemura/Music/sonic_pi/LCC_CHELL_HOUSE/synth_loops"
vox_loop = "/Users/k_ikemura/Music/sonic_pi/LCC_CHELL_HOUSE/vox loops"

use_debug false
use_bpm 60


kick_play = 1

hat_close_play = 1
hat_open_play = 0
snare_play = 1

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
    a = 1
    
    sample :bd_tek, rate: 1, amp: a
    sleep 0.5
  end
  
  live_loop :hat1, sync: :met do
    if hat_close_play < 1 then stop end
    
    use_sample_defaults rate: 1.2, lpf: 110, attack: 0.01
    
    sample :drum_cymbal_closed, amp: 0.5
    sleep 0.25
    sample :drum_cymbal_closed, amp: 1
    sleep 0.25
  end
  
  live_loop :cymbal_open, sync: :met do
    if hat_open_play < 1 then stop end
    ##| sleep 0.25
    sample :drum_cymbal_open, amp: 0.17, beat_stretch: 1.7, finish: 0.25, hpf: 80, rate: 1.2
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
    
    sample :glitch_perc1 , lpf: 80, rate: 0.7, amp: 1.5, finish: 0.125
    sample :glitch_perc1 , lpf: 50, rate: 0.5, amp: 1.5, finish: 0.125
    sleep 2
  end
  
  live_loop :safari, sync: :met do
    ##| stop
    sample :loop_safari, beat_stretch: 8, amp: 1.2
    sleep 8
  end
  
  live_loop :soft_kick, sync: :met do
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
    use_sample_defaults rate: 3, lpf: 80, amp: 0.7
    sleep 0.375+0.125
    
    12.times do
      sleep 0.125
      sample :elec_pop
    end
  end
  
  live_loop :temp, sync: :met do
    use_sample_defaults amp: 0.5, lpf: 120
    tablas = [
      :tabla_te1,
      :tabla_te2,
      :tabla_te_ne,
      :tabla_te_m,
    ].shuffle
    sample tablas.choose
    sleep 0.125
  end
end

############

live_loop :merody, sync: :met do
  stop
  use_synth_defaults release: 0.2, amp: 1
  use_synth :dtri
  use_random_seed 890
  
  c = chord(:g2, :M7)
  r = [
    0,
    #1,
    2,
    #3,
    #4
  ]
  
  play c.choose+r.choose
  sleep 0.375
  play c.choose+r.choose
  sleep 0.125
  12.times do
    play c.choose+r.choose
    sleep 0.125
  end
end

live_loop :mero2, sync: :met do
  stop
  use_random_seed 890
  use_synth_defaults release: 0.2, amp: 1
  
  use_synth :mod_tri
  
  notes = (scale :e1, :minor_pentatonic, num_octaves: 2).shuffle
  
  play notes.choose
  sleep 0.375
  play notes.choose
  sleep 0.125
  12.times do
    play notes.choose
    sleep 0.125
  end
  
end

########

live_loop :bass, sync: :met do
  ##| stop
  sample bass_loop, 9 ,beat_stretch: 8, amp: 1.2
  sleep 8
  
end

live_loop :synth_sample, sync: :met do
  if synth_sample_play < 1 then stop end
  use_sample_defaults beat_stretch: 8, amp: 0.5, finish: 0.25, lpf: 100
  
  sleep 4
  num = 0
  
  with_fx :reverb do
    sample synth_loop, num
    sleep 2
    
    sample synth_loop, num
    sleep 2
  end
end

live_loop :vox1, sync: :met do
  ##| stop
  if vox1_play < 1 then stop end
  num = 1 #1 4 5
  sample vox_loop, num ,beat_stretch: 4, amp: 0.6
  sleep 4
  
end

live_loop :vox2, sync: :met do
  if vox2_play < 1 then stop end
  num = 4 #1 4 5
  sample vox_loop, num ,beat_stretch: 4, amp: 0.7
  sleep 8
end
