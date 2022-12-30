use_bpm 65
use_random_seed 70000
drum = "/Users/k_ikemura/Music/sonic_pi/LCA_drum loops"

live_loop :bd do
  sleep 0.5
end

live_loop :cymbal_close, sync: :bd do
  sleep 0.25
  sample :drum_cymbal_closed, amp: [3, 1].tick, attack: 0.02, rate: 1.4
end

live_loop :drum, sync: :bd do
  sample drum ,1, beat_stretch: 8, amp: 1.8, lpf: 120
  sleep 8
end

notes1 = [68, 70, 73, 75, 79, 80, 82].shuffle
notes2 = [68, 70, 72, 73, 75, 79, 80, 82].shuffle

live_loop :mero, sync: :bd do
  use_synth :dtri
  sl = 0.125
  a = 0.5
  
  with_fx :reverb do
    8.times do
      synth :dtri, note: notes1.tick, cutoff: rrand(110, 100), release: sl*2, amp: a
      sleep sl
    end
    8.times do
      synth :dtri, note: notes2.tick, cutoff: rrand(110, 100), release: sl*2, amp: a
      sleep sl
    end
  end
end

live_loop :bass, sync: :bd do
  with_fx :distortion do
    synth :fm, note: :eb2, release: 0.13, amp: 2
    sleep 0.125
  end
end

live_loop :amb, sync: :bd do
  synth :tech_saws, note: :eb2, attack: 1, sustain: 8, cutoff: 50, amp: 1
  sleep 8
end

sl2 = [-2,0,5,10].shuffle
live_loop :strings, sync: :bd do
  use_synth :hollow
  play chord(:eb4+sl2.tick, :sus2), sustain: 4, release: 10, attack: 2, amp: 6
  sleep 8
end
