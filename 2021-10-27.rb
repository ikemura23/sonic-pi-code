use_bpm 75
drum = "/Users/k_ikemura/Music/sonic_pi/LCA_drum loops"
drum2 = "/Users/k_ikemura/Music/sonic_pi"

# Welcome to Sonic Pi

live_loop :kick do
  sample :bd_sone, amp: 2
  sleep 0.5
end

live_loop :drum_sample, sync: :kick do
  sample drum, 11 ,beat_stretch:8, amp: 1  #,hpf: 50
  sleep 8
end

live_loop :drum_sample2, sync: :kick do
  ##| sample drum2, 4, beat_stretch:8, amp: 3, hpf:118, start: 0, finish: 0.5
  sleep 4
end

notes = ring(:bb1,:c2,:g1)
base_amp = 0

live_loop :base, sync: :kick do
  use_synth :mod_tri #:tri :mod_tri
  3.times do
    play notes.tick, amp: base_amp, release: 0, sustain: 0.75
    sleep 0.75
  end
  
  sleep 1.75
end

live_loop :cd, sync: :kick do
  
  use_synth :sine
  3.times do
    play chord(notes.tick+36, :m7), release: 0, sustain: 0.25
    sleep 0.5
  end
  sleep 0.25
end