# 2025-01-03 Deep House Jam - Sonic Pi
# Background movie: https://www.youtube.com/watch?v=Eei0LPZOdJs

use_bpm 62

cymbal_open_flag = 1

# Metronome

live_loop :met do
  sleep 1
end

# drum ######################

live_loop :kick, sync: :met do
  #use_sample_defaults amp: 1, lpf: 100
  sample :bd_tek
  sleep 0.5
end

# Hat ########################

live_loop :hat, sync: :met do
  use_sample_defaults amp: 0.8
  
  sample :hat_tap
  sleep 0.125
  sample :hat_tap
  sleep 0.125
  sample :drum_cymbal_closed
  sleep 0.25
  
end


live_loop :cymbal_open, sync: :met do
  if cymbal_open_flag < 1 then stop end
  sleep 0.25
  sample :drum_cymbal_open, amp: 0.25, beat_stretch: 1.8, finish: 0.125, hpf: 90#, rate: 1.1
  sleep 0.25
end

# Loop ########################

live_loop :loop_safari, sync: :met do
  
  sample :loop_safari, beat_stretch: 8, amp: 2.5
  sleep 8
  
end

# Clap ########################
live_loop :clap, sync: :met do
  ##| if drum_clap_play < 1 then stop end
  use_synth :sc808_clap
  use_synth_defaults amp: 1.5
  
  sleep 0.5
  
  play :c
  
  sleep 0.5
end


# Synth ########################

live_loop :synth_1, sync: :met do
  ##| stop
  
  use_synth :saw
  use_synth_defaults release: 0.25, attack: 0, amp: 0.8
  
  with_fx :reverb, mix: 0.6 do
    with_fx :distortion, mix: 0.5 do
      with_fx :echo, mix: 0.25, decay: 0.375  do
        with_fx :lpf, cutoff: 110 do
          ##| stop
          play chord(:c3, :M7)
          sleep 0.375
          play chord(:ds3, :M7)
          sleep 0.375
          play chord(:g2, :M7)
          sleep 0.375
          sleep 0.125
          ##| play chord(:g4, :M7)
          sleep 0.5
          play chord(:g2, :M7)
          sleep 0.25
          
          play chord(:as2, :M7)
          sleep 0.375
          play chord(:as2, :M7)
          sleep 0.375
          play chord(:c3, :M7)
          sleep 0.375
          
          sleep 0.125
          ##| play chord(:c5, :M7)
          sleep 0.5
          play chord(:g2, :M7)
          sleep 0.25
        end
      end
    end
  end
end


live_loop :bass, sync: :met do
  ##| stop
  use_synth_defaults release: 0.25, amp: 1.5
  
  use_synth :dpulse
  
  with_fx :lpf, cutoff: 90, mix: 1 do
    with_fx :reverb, mix: 0 do
      with_fx :echo, mix: 0.1, decay: 0.375  do
        ##| stop
        play :c2
        sleep 0.375
        play :ds2
        sleep 0.375
        play :g1
        sleep 0.375
        sleep 0.125
        play :g1
        sleep 0.5
        play :g1
        sleep 0.25
        
        play :as1
        sleep 0.375
        play :as1
        sleep 0.375
        play :c2
        sleep 0.375
        
        sleep 0.125
        play :c2
        sleep 0.5
        play :g1
        sleep 0.25
      end
    end
  end
end
