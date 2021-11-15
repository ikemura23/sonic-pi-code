use_bpm 80

live_loop :drum do
  sample :bd_zome
  sleep 1
  sample :sn_generic,rate: 1
  ##| sample :tabla_te_m
  
  sleep 1
end

cd = :c5
live_loop :pico do
  use_synth :dpulse
  play cd, release: 0.3
  sleep 0.5
  play cd-7, release: 0.3
  sleep 0.25
  play cd-5, release: 0.3
  sleep 0.25
  
  play cd, release: 0.3
  sleep 0.25
  play cd-5, release: 0.3
  sleep 0.25
  play cd-7, release: 0.3
  sleep 0.25
  play cd-12, release: 0.3
  sleep 0.25
end

live_loop :base1 do
  use_synth :dpulse
  c = [:f2, :c2, :f2, :c3].ring.tick
  play c, release: 0.3
  sleep 1
end

live_loop :base2 do
  use_synth :hollow
  synth :hollow, note: :f2, sustain: 4,release: 0
  synth :fm, note: :f2, sustain:  4,release: 0
  synth :sine, note: :f2, sustain: 4,release: 0
  ##| play :f2, sustain: 4
  sleep 4
end

