use_debug false
use_bpm 65

live_loop :met do
  sleep 1
end

live_loop :bd, sync: :met do
  sleep 0.5
  sample :bd_tek, cutoff: 100, amp: 1.2
end

with_fx :lpf, cutoff: 110 do
  live_loop :hhc1, sync: :met do
    ##| if hat_flag < 1 then stop end
    
    sleep 0.125
    ##| sample :drum_cymbal_closed, amp: 0.5, rate: 1.5
    sleep 0.125
    sample :drum_cymbal_closed, amp: 1.2, rate: 1
    sleep 0.125
    ##| sample :drum_cymbal_closed, amp: 1.2, rate: 1.7
    sleep 0.125
  end
  
  live_loop :hhc2, sync: :met do
    ##| if hat_flag < 1 then stop end
    sleep 0.5
    
    sleep 0.125
    sample :drum_cymbal_closed, amp: 0.5, rate: 1.5
    sleep 0.125
    sample :drum_cymbal_closed, amp: 0.5, rate: 1.5
    sleep 0.125
    sleep 0.125
    
    sample :drum_cymbal_closed, amp: 0.5, rate: 1.5
    sleep 0.125
    sample :drum_cymbal_closed, amp: 0.5, rate: 1.5
    sleep 0.125
    ##| sample :drum_cymbal_closed, amp: 1.2, rate: 1
    sleep 0.125
    sample :drum_cymbal_closed, amp: 0.5, rate: 1.5
    sleep 0.125
    
    sleep 2.5
  end
  
  
  live_loop :snare, sync: :met do
    ##| if clap_flag < 1 then stop end
    
    a = 0.85
    co = 95
    at = 0.00
    r = 3
    sleep 0.5
    sample :sn_generic, rate: r+1, cutoff: co, amp: a, attack: at
    sample :sn_generic, rate: r, start: 0.02, cutoff: co, pan: 0.2, amp: a, attack: at
    sleep 0.5
  end
  
  live_loop :snare_fill_in, sync: :met do
    ##| if clap_flag < 1 then stop end
    
    a = 0.85
    co = 95
    at = 0.00
    r = 3
    sleep 0.5
    
    sample :sn_generic, rate: r+1, cutoff: co, amp: a, attack: at
    sample :sn_generic, rate: r, start: 0.02, cutoff: co, pan: 0.2, amp: a, attack: at
    sleep 0.5
  end
  
  live_loop :elec_blp_loop, sync: :met do
    
    sleep 0.25
    play_elec_blp
    sleep 0.75
    play_elec_blp
    sleep 1
    
    play_elec_blp
    sleep 0.25
    
    sleep 0.5
    
    3.times do
      play_elec_blp
      sleep 0.25
    end
    sleep 0.25
    
    sleep 0.25
  end
  
  
  define :play_elec_blp do
    sample :elec_blip
  end
  
end

## bass ##
live_loop :bass_loop, sync: :bd do
  bass1 :f2
end


define :bass1 do | note, ef=0|
  with_fx :reverb do
    use_synth :fm # :fm
    use_synth_defaults release: 0.3, amp: 1.2, attack_level: 2
    
    play note
    sleep 0.5
    play note
    sleep 0.375
    play note+7
    sleep 1-0.5-0.375
    
    sleep 0.25
    play note+5
    sleep 0.25
    play note+5
    sleep 0.25
    play note+7
    sleep 0.25
  end
end
