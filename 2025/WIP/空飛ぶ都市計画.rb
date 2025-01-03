# CAPSULE - 空飛ぶ都市計画
# https://youtu.be/ZezfpWmfacc?si=pnhoshDi0YTbrsNH&t=88

use_bpm 63

claps = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_claps"

live_loop :met do
  sleep 1
end

# Drum #####################################

live_loop :bd, sync: :met do
  
  sample :bd_haus, amp: 1.7
  sleep 0.5
end

with_fx :reverb, mix: 0.2 do
  
  live_loop :drum_cymbal_open, sync: :met do
    
    use_sample_defaults lpf: 130, amp: 0.2
    sleep 0.25
    
    with_fx :distortion, mix: 0.2 do
      sample :drum_cymbal_open,  beat_stretch: 1.8, finish: 0.125, hpf: 90
    end
    
    sleep 0.25
    
  end
  
  live_loop :hat, sync: :met do
    use_sample_defaults lpf: 120, amp: 0.7
    sample :hat_bdu
    sleep 0.125
    sample :hat_bdu
    sleep 0.125
    sample :hat_bdu
    sleep 0.25
    
  end
  
  
  live_loop :clap, sync: :met do
    
    sleep 0.5
    ##| with_fx :reverb, mix: 0.4 do
    sample claps, 0, amp: 1, lpf: 120, rate: 0.8
    ##| end
    sleep 0.5
    
  end
  
end

live_loop :tabla, sync: :met  do
  
  use_sample_defaults lpf: 130, amp: 0.7
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

# Synth #####################################

live_loop :synth_a, sync: :met  do
  ##| stop
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
end


live_loop :main_melody, sync: :met do
  ##| stop
  use_synth_defaults release: 0.5, amp: 0.2
  use_synth :dpulse
  
  note = :g5
  
  2.times do
    
    play note
    sleep 0.5
    play note
    sleep 0.5
    play note
    sleep 0.25
    play note-2
    sleep 0.5
    
    play note
    sleep 0.5
    play note
    sleep 0.5
    play note-2
    sleep 0.25
    play note+3
    sleep 0.25
    play note+3
    sleep 0.25
    play note+[1, 5].tick
    sleep 0.5
    
    play note
    sleep 0.5
    play note
    sleep 0.5
    play note
    sleep 0.25
    play note-2
    sleep 0.5
    play note
    sleep 0.5
    
    sleep 1.75
  end
  
end

live_loop :bell, sync: :met do
  ##| stop
  use_synth_defaults release: 0.7, amp: 0.5
  use_synth :pretty_bell
  
  note = :g6
  
  with_fx :lpf, cutoff: 100 do
    2.times do
      
      play note
      sleep 0.5
      play note
      sleep 0.5
      play note
      sleep 0.25
      play note-2
      sleep 0.5
      
      play note
      sleep 0.5
      play note
      sleep 0.5
      play note-2
      sleep 0.25
      play note+3
      sleep 0.25
      play note+3
      sleep 0.25
      play note+[1, 5].tick
      sleep 0.5
      
      play note
      sleep 0.5
      play note
      sleep 0.5
      play note
      sleep 0.25
      play note-2
      sleep 0.5
      play note
      sleep 0.5
      
      sleep 1.75
    end
  end
end


# Bass #####################################

live_loop :bass, sync: :met do
  
  use_synth_defaults release: 0.25, sustain: 0, amp: 1.5
  use_synth :fm
  
  play :f2
  sleep 0.25
  
  play :f2
  sleep 0.25
  
  play :g2
  sleep 0.25
  
  play :g2
  sleep 0.25
  
  play :as2
  sleep 0.375
  
  play :c3
  sleep 0.375
  
  play :ds3
  
  sleep 0.25
end
