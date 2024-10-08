# NewJeans - OMG


# Chord: https://www.youtube.com/watch?v=RQrZznPTRaI
# Drum: https://www.youtube.com/watch?v=1_kcaxyw7rU
# Bass https://www.youtube.com/watch?v=rJhFpzbgXlE

use_bpm 60

# intro
synth_intro_play = 1

# verse 1
drum_hat_play = 0
synth_verse_play = 0

drum_kick_play = 0
drum_clap_play = 0
perc_cowbel_play  = 0
bass_verse_play = 0



live_loop :met do
  sleep 0.5
end

# Drum ########################

live_loop :kick, sync: :met do
  if drum_kick_play < 1 then stop end
  
  sample :bd_tek
  sleep 1
  sleep 0.25
  sample :bd_tek
  sleep 0.5
  sleep 0.125
  sample :bd_tek
  sleep 0.125
  
  sample :bd_tek
  sleep 0.25
  sample :bd_tek
  sleep 0.5
  sample :bd_tek
  sleep 0.5
  sample :bd_tek
  sleep 0.5
  sleep 0.25
  
end


live_loop :hat_1, sync: :met do
  if drum_hat_play < 1 then stop end
  
  sample :hat_bdu, lpf: 130
  sleep 0.25
  sample :hat_yosh
  sleep 0.125
  sample :hat_yosh
  sleep 0.25
  sample :hat_yosh
  sleep 0.25
  sleep 0.125
  
  sample :hat_bdu, lpf: 130
  sleep 0.25
  sample :hat_yosh
  sleep 0.125
  sample :hat_yosh
  sleep 0.25
  sample :hat_yosh
  sleep 0.125
  sample :hat_yosh
  sleep 0.25
  
  sample :hat_bdu, lpf: 130
  sleep 0.25
  sample :hat_yosh
  sleep 0.125
  sleep 0.25
  sample :hat_yosh
  sleep 0.25
  sleep 0.125
  
  sample :hat_bdu, lpf: 130
  sleep 0.125
  sleep 0.25
  sleep 0.125
  sample :hat_yosh
  sleep 0.25
  sample :hat_yosh
  sleep 0.25
end

# Clap ########################
live_loop :clap, sync: :met do
  if drum_clap_play < 1 then stop end
  use_synth :sc808_clap
  use_synth_defaults amp: 1.5
  
  sleep 0.5
  
  play :c
  
  sleep 0.5
end

# Cowbel ########################

live_loop :cowbell, sync: :met do
  if perc_cowbel_play < 1 then stop end
  
  a = 0.2
  use_sample_defaults lpf: 120, amp: a, rate: 2
  
  sleep 0.5
  
  sleep 0.125
  sample :drum_cowbell
  sleep 0.25
  sample :drum_cowbell
  sleep 0.25
  sample :drum_cowbell
  sleep 0.25
  sample :drum_cowbell, amp: [0, a].tick
  sleep 0.125
  sleep 0.5
  
end


# SFX ########################
live_loop :sfx, sync: :met do
  
  sleep 15
  sample :perc_bell2, lpf: 100, start: 0.05
  sleep 1
end

live_loop :hat3, sync: :met do
  use_sample_defaults lpf: 110
  sleep 15
  6.times do
    sample :hat_zap
    sleep 0.25/3
  end
  sample :hat_zap
  sleep 0.25
  sample :hat_zap
  sleep 0.25
end

# Synth ########################

live_loop :synth_1, sync: :met do
  if synth_intro_play < 1 then stop end
  
  use_synth_defaults release: 0.05, attack: 0.11, amp: 1
  use_synth :saw
  with_fx :reverb do
    
    progression = [
      chord(:g3, :m9),
      [55.0, 58.0, 61.0, 65.0, 69.0], # Bbm(maj7/C
      chord(:d3, :m9),
      chord(:a3, :m7),
      
      chord(:g3, :m9),
      [55.0, 58.0, 61.0, 65.0, 69.0], # Bbm(maj7/C
      chord(:d3, :m11),
      chord(:a3, :m7),
    ]
    
    progression.size.times do
      current = progression.tick
      2.times do
        with_fx :lpf, cutoff: 130 do
          with_fx :wobble, phase: 0.5, invert_wave: 1, wave: 0 do
            play current
            sleep 1
          end
        end
      end
    end
  end
end


live_loop :synth_2, sync: :met do
  
  if synth_verse_play < 1 then stop end
  
  use_synth_defaults  release: 2, attack: 0.125, amp: 1
  use_synth :dsaw
  with_fx :reverb do
    
    with_fx :lpf, cutoff: 90 do
      
      play chord(:g3, :m9)
      sleep 2-0.25
      play [55.0, 58.0, 61.0, 65.0, 69.0] # Bbm(maj7/C
      sleep 2+0.25
      
      play chord(:d3, :m9)
      sleep 2-0.25
      play chord(:a3, :m7)
      sleep 2-0.25
      play chord(:ab3, :m7), release: 0.75
      sleep 0.5
      
    end
    
  end
end

# Bass ########################
live_loop :bass, sync: :met do
  if bass_verse_play < 1 then stop end
  
  use_synth_defaults  release: 0.25, attack: 0, amp: 1
  use_synth :fm
  
  # 1
  play :g2
  sleep 0.375
  play :g2
  sleep 0.375
  sleep 0.5
  play :g3
  sleep 0.25
  play :c3
  sleep 0.25
  sleep 0.25
  
  # 2
  sleep 0.25
  play :c3, release: 0.5
  sleep 0.5
  play :c3, release: 0.5
  sleep 0.5
  play :db3, release: 0.5
  sleep 0.5
  play :db3
  sleep 0.25
  
  # 3
  play :d3
  sleep 0.375
  play :d3
  sleep 0.375
  sleep 0.5
  play :d4
  sleep 0.25
  play :d3
  sleep 0.25
  sleep 0.25
  
  # 4
  sleep 0.25
  play :d3, release: 0.5
  sleep 0.5
  play :d3, release: 0.5
  sleep 0.5
  play :db2, release: 0.5
  sleep 0.5
  play :b3
  sleep 0.25
end

