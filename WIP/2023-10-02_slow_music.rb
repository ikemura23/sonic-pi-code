use_bpm 50
use_random_seed 2000

live_loop :met do
  sleep 0.5
end
live_loop :hat, sync: :met do
  ##| sample :hat_bdu
  sleep 1
end

live_loop :synt_hollo, sync: :met do
  ##| stop
  use_synth_defaults amp: 3, sustain: 2.5, release: 1 , attack: 0.5
  use_synth :hollow
  
  play chord(:f3, :M7)
  sleep 4
  
  play chord(:f3-1, :m7)
  sleep 4
end

live_loop :synt_saw, sync: :met do
  
  use_synth_defaults amp: 0.5, sustain: 2.5, release: 1 , attack: 0.5
  use_synth :dsaw
  
  with_fx :lpf, cutoff: 60 do
    play chord(:f2, :M7)
    sleep 4
    
    play chord(:f2-1, :m7)
    sleep 4
  end
  
end

c = (chord(:c5, :M).to_a.push chord(:c5, :M).first+2).shuffle

live_loop :piano, sync: :met do
  
  use_synth :piano
  use_synth_defaults amp: 0.5
  
  with_fx :reverb, mix: 0.7, room: 1 do
    play c.tick
    sleep 1
  end
end
