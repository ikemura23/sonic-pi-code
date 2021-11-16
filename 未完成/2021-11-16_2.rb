##| drum = "/Users/k_ikemura/Music/sonic_pi/drum_slow"

cd = :a3

live_loop :industry, sync: :drum_bd do
  ##| sample :loop_industrial, beat_stretch: 1, cutoff: 130, amp: 1
  sleep 1
end

live_loop :drum_bd do
  sample :bd_haus
  sleep 0.5
end

cds = [:c4, :e3]
live_loop :cd do
  use_synth :prophet
  play chord(:c4, :m7), release: 1.75, cutoff: 70
  sleep 1.75
  play chord(:c4, :m6), release: 2+2-1.75, cutoff: 70
  sleep 2+2-1.75
  
  play chord(:e4, :m9), release: 1.75, cutoff: 70
  sleep 1.75
  play chord(:e4, :m6), release: 2+2-1.75, cutoff: 70
  sleep 2+2-1.75
end