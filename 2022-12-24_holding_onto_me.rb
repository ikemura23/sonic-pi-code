# output https://twitter.com/ikemura23/status/1606683681418276864

use_debug false
use_bpm 65

clap = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_claps"
hat = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_hats"
vox_sample = "/Users/k_ikemura/Music/sonic_pi/LCC_CHELL_HOUSE/vox\ loops"

kick_hat_flag = 1
clap_flag = 1
mero1_flag = 1
mero2_flag = 0
mero3_flag = 0

live_loop :met do
  sleep 1
end

with_fx :reverb, room: 0.2 do
  
  live_loop :kick, sync: :met do
    if kick_hat_flag < 1 then stop end
    a = 1.7
    
    sample :bd_tek, rate: 1, amp: a
    sleep 0.5
  end
  
  live_loop :hhc1, sync: :met do
    if kick_hat_flag < 1 then stop end
    sleep 0.25
    sample hat, 16, amp: 0.5
    sleep 0.25
    
  end
  
  live_loop :hhc2, sync: :met do
    if kick_hat_flag < 1 then stop end
    sample hat, 8, amp: 0.5, rate: 1.5
    sleep 0.25
    
  end
  
  live_loop :hhc3, sync: :met do
    if clap_flag < 1 then stop end
    
    sample hat, 0, amp: 0.1, rate: 2
    sleep 0.125
  end
  
  live_loop :crash, sync: :met do
    sample :drum_splash_hard, amp: 0.7
    sleep 16
  end
  
  live_loop :clap, sync: :met do
    if clap_flag < 1 then stop end
    14.times do
      sleep 0.5
      sample clap, 0, amp: 1, lpf: 130, rate: 1.1
      sleep 0.5
    end
  end
  
  live_loop :vox, sync: :met do
    
    with_fx :reverb, mix: 0.7, room: 0.8, amp: 0.5 do
      ##| sample vox_sample, 7, cutoff: 110, start: 0, finish: 0.27
      
      ##| sample vox_sample, 10, cutoff: 130, start: 0, finish: 0.15
      sleep 2
      sample vox_sample, 10, cutoff: 130, start: 0, finish: 0.15
      sleep 2
      ##| sample vox_sample, 10, cutoff: 130, start: 0.4, finish: 0.5, beat_stretch: 7.5
      
    end
  end
  
end

#------

live_loop :base, sync: :met do
  ##| stop
  use_random_seed 400
  
  sl = [0.25, 0.125, 0.125, 0.125, 0.375,0.25, 0.25, 0.25,0.25].shuffle
  sc = [:a2, :a2+2, :a2+5, :a2-2]
  2.times do
    s = sc.tick('sc')
    sl.size.times do
      
      synth :fm, note: s, sustain: 0.05, release: 0.2, amp: 0.8
      synth :dsaw, note: s-12, sustain: 0.05, release: 0.2, amp: 1, cutoff: 90
      sleep sl.tick('sl')
    end
    4-sl.sum
  end
end

# ----------

live_loop :mero1, sync: :met do
  ##| stop
  if mero1_flag < 1 then stop end
  sine_long :d3,   1.75
  sine_long :d3+2, 2.25
  
  sine_long :d3+5, 4
  
  ##| sine_long :d3+5, 1.75
  ##| sine_long :d3-2, 2.25
  
  ##| sine_long :d3-2, 4
  
end

define :sine_long do |tonic, beats|
  synth :sine, note: chord(tonic, :m9, invert: 0), release: 0, sustain: beats, attack: 0, amp: 1.2-0.2
  synth :dsaw, note: chord(tonic, :m9, invert: 0), release: 0, sustain: beats, attack: 0, amp: 0.5-0.2
  sleep beats
end

live_loop :mero2, sync: :met do
  if mero2_flag < 1 then stop end
  sl = [0.5, 0.375, 0.375, 0.375, 0.375, 0.375, 0.375, 0.375, 0.125]
  ef = [0,0,2,2,0,0,0,-5,-5]
  
  with_fx :reverb, mix: 0.6, room: 0.7 do
    ##| with_fx :wobble, phase: 8, invert_wave: 0, mix: 0.3 do
    tick_reset
    sl.size.times do
      synth :dsaw, note: chord(:d3+7+ef.tick, :m7, invert: 2), release: 0.3, attack: 0.05, amp: 1, cutoff: 80
      sleep sl.look
    end
    sleep 4-sl.sum
  end
  ##| end
end

live_loop :mero3, sync: :met do
  if mero3_flag < 1 then stop end
  with_fx :reverb, mix: 0.5, room: 0.7 do
    with_fx :lpf, cutoff: 90, amp: 0.8 do
      use_synth :prophet
      sleep 0.25
      play :d4+14, sustain: 0.25
      sleep 0.25
      play :d4+12, sustain: 0.25
      sleep 0.25
      
      play :d4+7, sustain: 3.5-0.25*3
      sleep 3.5-0.25*3
      
      play :d4+5, sustain: 0.25
      sleep 0.25
      play :d4+7, sustain: 2, release: 2
      sleep 4.25
    end
  end
end
