# 2023/05/12 drum'n'bass
# Title: Silver Stream
# Background Movie: https://youtu.be/rzdspUDwzXU?t=376
# Original Music https://youtu.be/TDIPGQWedvo

# Output
#  Twitter https://twitter.com/ikemura23/status/1659004634831396864
#  YouTube https://youtu.be/0odiIr8C5MM

drum_loops = "/Users/k_ikemura/Music/sonic_pi/LCA_LIQUID_DNB/LCA_drum\ loops/LCA_drum\ loops\ full"
top_loops = "/Users/k_ikemura/Music/sonic_pi/LCA_LIQUID_DNB/LCA_drum\ loops/LCA_top\ loops"

use_debug false
use_bpm 78

drum_loop_play = 0

bd_play = 0

ride_cymbal_play_flag = 1

cymbal_open_flag = 0

synth1_play = 1
synth2_play = 1
synth3_play = 0

bass_play = 1

## metronome ############################################

live_loop :met do
  sleep 1
end

## drum ############################################

live_loop :drum_sample_loop, sync: :met do
  if drum_loop_play < 1 then stop end
  
  sample drum_loops, 9, amp: 0.5, beat_stretch: 8, rate: 1, hpf: 118/3
  sleep 8
end

with_fx :reverb, room: 0.2, mix: 0.5 do
  
  live_loop :ride_cymbal, sync: :met do
    if ride_cymbal_play_flag < 1 then stop end
    _amp = 0.2
    use_sample_defaults beat_stretch: 1.7, amp: _amp
    
    sample :drum_cymbal_hard
    sleep 0.5
    
    sample :drum_cymbal_hard
    sleep 0.5
    
    4.times do
      sample :drum_cymbal_hard, amp: _amp/3
      sleep 0.25
      
      sample :drum_cymbal_hard
      sleep 0.5
    end
  end
end

live_loop :drum_splash, sync: :met do
  sample :drum_splash_soft, rate: 1
  sleep 16
end

live_loop :misc_cineboom, sync: :met do
  sleep 16
  
  sleep 13.6
  sample :misc_cineboom, beat_stretch: 12, start: 0, finish: 0.2
  sleep 2.4
end

## bass ############################################

live_loop :bass_loop, sync: :met do
  if bass_play < 1 then stop end
  
  use_synth :beep
  
  default_cutoff = 130
  default_amp = 1
  use_synth_defaults release: 0.1, sustain: 0.5, amp: default_amp, attack_level: 0, cutoff: default_cutoff
  
  with_fx :reverb do
    
    play :f2, sustain: 0, release: 8, note_slide: 6 do |s|
      control s, note: :f1
    end
    sleep 4
    
    sleep 3.25
    play :b2, sustain: 0.7, release: 0.05, note_slide: 0.75 do |s|
      control s, note: :a2
    end
    sleep 0.75
  end
end

## synth ############################################

live_loop :synth1, sync: :met do
  if synth1_play < 1 then stop end
  _amp = 1
  use_synth_defaults release: 2.5, sustain: 0, amp: _amp, attack: 0, cutoff: 80
  use_synth :dsaw
  
  with_fx :wobble, invert_wave: 1, phase: 0.375, wave: 0, mix: 0.15 do
    
    with_fx :rlpf, cutoff: 90 do
      play chord(:f3, :m7)
      sleep 2
      
      play chord(:g3, :m7)
      sleep 1.75
      
      play chord(:fs3, :M7), release: 3.5
      
      sleep 4-1.75+2
    end
  end
end

live_loop :synth2, sync: :met do
  if synth2_play < 1 then stop end
  
  use_synth_defaults release: 0.2, sustain: 0, amp: 0.7, attack: 0.05, cutoff: 90
  use_synth :dsaw
  key = :bb4
  
  with_fx :reverb, room: 0.4, mix: 0.7 do
    with_fx :hpf, mix: 0.7 do
      3.times do
        sleep 0.5
        
        4.times do
          play key
          sleep 0.75
        end
        sleep 0.5
      end
      sleep 0.5
      
      3.times do
        play key
        sleep 0.75
      end
      play key+5
      sleep 0.75
      
      sleep 0.5
    end
  end
end

live_loop :synth3, sync: :met do
  if synth3_play < 1 then stop end
  use_synth_defaults release: 0.5, sustain: 3, attack: 1, amp: 0.4
  use_synth :dsaw
  
  with_fx :flanger do
    with_fx :hpf, cutoff: 100 do
      
      play :f4
      sleep 4
      play :bb3
      sleep 4
      play :bb4
      sleep 4
      play :eb5
      sleep 4
      
      play :f4
      sleep 4
      play :bb3
      sleep 4
      play :eb5
      sleep 4
      play :f5
      sleep 4
    end
  end
end
