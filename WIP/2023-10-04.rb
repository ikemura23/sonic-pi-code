
## https://www.youtube.com/live/VaHx32PHSg0?si=zVgVl3ozjLsogiXG&t=2275
use_bpm 62

live_loop :met do
  sleep 0.5
end

live_loop :kick, sync: :met do
  stop
  a = 1
  
  sample :bd_tek, rate: 1, amp: a, lpf: 110
  sleep 0.5
end

live_loop :hat1, sync: :met do
  ##| stop
  use_sample_defaults rate: 1, lpf: 100, attack: 0.01, amp: 0.4
  
  ##| sample :hat_bdu
  sleep 0.125
  
  ##| sample :hat_bdu
  sleep 0.125
  
  ##| sleep 0.25
  sample :drum_cowbell, rate: 2, hpf: 100, lpf: 90
  ##| sample :hat_zap, amp: 0.8, hpf: 100, rate: 1.5, lpf: 120
  sleep 0.125
  
  ##| sample :hat_bdu
  sleep 0.125
end

live_loop :hat2, sync: :met do
  stop
  use_sample_defaults rate: 1.5, lpf: 120#, attack: 0.01
  sleep 0.25
  sample :hat_zap, amp: 0.8, hpf: 100
  sleep 0.25
end

live_loop :hat3, sync: :met do
  stop
  use_sample_defaults rate: 1, lpf: 110#, attack: 0.01
  sleep 0.25
  sample :hat_psych, amp: 0.8, hpf: 100
  sleep 0.25
end

live_loop :snare_loop, sync: :met do
  
  ##| stop
  
  use_sample_defaults amp: 0.4, cutoff: 120
  
  sleep 0.5
  
  sample :sn_generic, rate: 4
  sample :sn_generic, rate: 3, start: 0.02, pan: 0.2
  
  sleep 0.5
end

live_loop :electric_sounds, sync: :met do
  ##| stop
  use_sample_defaults lpf: 90, amp: 0.8
  
  with_fx :reverb, mix: 0.8, room: 0.6 do
    with_fx :hpf, cutoff: 80 do
      sleep 3.5+0.125*2
      sample :elec_twang, rate: 0.5, finish: 0.25
      sleep 0.125
      sample :elec_twang, rate: 1.5
      sleep 0.125
      
      sleep 3
      sleep 0.25
      sample :elec_pop, rate: 0.8
      sleep 0.25
      sleep 0.25
      sample :elec_pop, rate: 0.8
      sleep 0.25
    end
  end
end



# synth ###################################

live_loop :synth1, sync: :met do
  
  ##| use_synth_defaults attack: 2, release: 2.5
  use_synth_defaults amp: 2.7, sustain: 8, attack: 0.1
  use_synth :hollow
  
  with_fx :lpf, cutoff: 70 do
    play chord(:c4, :M7, invert: 2)
    sleep 8
    
    play chord(:c4-2, :M7, invert: 2)
    sleep 8
  end
end

live_loop :synth2, sync: :met do
  ##| stop
  use_synth_defaults amp: 1.6, sustain: 8, attack: 0.1
  use_synth :dsaw
  
  with_fx :lpf, cutoff: 50 do
    play chord(:c3, :M7, invert: 2)
    sleep 8
    
    play chord(:c3-2, :M7, invert: 2)
    sleep 8
  end
end

live_loop :bass, sync: :met do
  use_synth_defaults amp: 0.9, attack: 0.0035, release: 0.25
  use_synth :fm
  
  8.times do |i|
    key = if i<4 then :d2 else :d2 end
    
    sleep 0.25
    play key
    sleep 0.25
    play key+2
    sleep 0.25
    sleep 0.25
    
    play key+7
    sleep 0.375
    play key+5
    sleep 0.375
    play key+2
    sleep 0.25
  end
  
end
