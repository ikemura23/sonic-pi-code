# 2023/05/11 drum'n'bass

hat_loops = "/Users/k_ikemura/Music/sonic_pi/LCA_LIQUID_DNB/LCA_drum\ loops/LCA_hat\ loops"

amen_brakes_loops = "/Users/k_ikemura/Music/sonic_pi/Amen\ Breaks\ Compilation/Amen\ Breaks\ Volume\ 1/WAV"
# amen_brakes sample download https://rhythm-lab.com/amen_breaks/

use_debug false
use_bpm 90

bd_play = 1

hat_loops_play = 1
amen_brakes_loops_play = 0

synth_lead_play = 1

bass_play = 1

## metoronome ############################################

live_loop :met do
  sleep 1
end

## drum ############################################

live_loop :drum_hat_loop, sync: :met do
  if hat_loops_play < 1 then stop end
  
  sample hat_loops, 5, amp: 0.5, beat_stretch: 8, start: 0, finish: 0.5, hpf: 118/3
  sleep 4
end

live_loop :amen_brakes_loop, sync: :met do
  if amen_brakes_loops_play < 1 then stop end
  
  with_fx :hpf, mix: 0.5 do
    sample amen_brakes_loops, 5, amp: 2, beat_stretch: 4#, start: 0, finish: 0.5#, lpf: 118/5
    sleep 4
  end
  
end

with_fx :reverb, room: 0.2, mix: 0.5 do
  
  live_loop :bd, sync: :met do
    if bd_play < 1 then stop end
    _co = 100
    _symbol = :bd_ada # :bd_ada :bd_zum
    
    use_sample_defaults cutoff: 100, rate: 0.8, amp: 1.5
    
    sample _symbol
    sleep 0.5
    
  end
  
  live_loop :drum_splash, sync: :met do
    sample :drum_splash_soft
    sleep 16
  end
end


live_loop :misc_cineboom, sync: :met do
  sleep 16
  
  sleep 13.6
  sample :misc_cineboom, beat_stretch: 12, start: 0, finish: 0.2, amp: 1.5
  sleep 2.4
  
end

## bass ############################################

live_loop :bass_loop, sync: :met do
  if bass_play < 1 then stop end
  with_fx :reverb do
    tick_reset
    use_synth :beep # :fm :beep
    
    default_cutoff = 130
    default_amp = 2
    use_synth_defaults release: 0, sustain: 0.75, amp: default_amp, cutoff: default_cutoff
    
    key = :d2
    
    3.times do
      play key
      sleep 0.75
      play key+4
      sleep 0.75
      play key-2, sustain: 0.5
      sleep 0.5
    end
    
    play key
    sleep 0.75
    play key+4
    sleep 0.75
    play key+8, sustain: 0.5
    sleep 0.5
    
  end
end

## synth ############################################

live_loop :synth_lead, sync: :met do
  if synth_lead_play < 1 then stop end
  use_synth_defaults release: 0, sustain: 0.25, amp: 1, attack: 0, cutoff: 100
  use_synth :supersaw #:subpulse # :dsaw
  
  with_fx :compressor do
    with_fx :distortion , mix: 0.5 do
      with_fx :reverb, room: 0.5, mix: 0.4 do
        with_fx :echo, mix: 0.125 do
          
          cd = chord(:fs3, :m7, num_octaves: 2)
          
          play cd
          sleep 0.5
          
          play cd
          sleep 0.5
          
          sleep 0.25
          play cd+3
          sleep 1-0.25
          
          play cd
          sleep 0.5
          sleep 0.25
          
          play cd+3
          sleep 0.5
          play cd+2, sustain: 0.25*2
          sleep 0.25*3
          
          # ---
          
          play cd
          sleep 0.5
          
          play cd
          sleep 0.5
          
          sleep 0.25
          play cd+3
          sleep 1-0.25
          
          play cd
          sleep 0.5
          sleep 0.25
          
          play cd-4
          sleep 0.5
          play cd-2, sustain: 0.25*2
          sleep 0.25*3
          
  end end end end
end
