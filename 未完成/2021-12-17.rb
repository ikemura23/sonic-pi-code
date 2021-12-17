##| use_bpm 40

drum = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_drum\ loops/LCKK_drum\ loops\ full"

live_loop :bd do
  sleep 0.5
  sample :bd_tek
end

live_loop :cymbal_close, sync: :bd do
  sleep 0.25
  sample :drum_cymbal_closed, amp: 2, attack: 0.02, rate: 3
  sleep 0.125
  sample :drum_cymbal_closed, amp: 2, attack: 0.02, rate: 3
  sleep 0.125
end

live_loop :drum, sync: :bd do
  sample drum, 7, beat_stretch: 4, amp: 1.5
  sleep 4
end

live_loop :string, sync: :bd do
  with_fx :hpf, cutoff: 50 do
    invert = [0,1,2].first
    ef = [0, 5].ring
    c = chord_invert(chord(:c3, :m9), 0)
    2.times do
      n = c+ef.tick
      synth :piano, note: n, amp: 2
      synth :hollow, note: n, release: 4, amp: 5
      sleep 4
    end
  end
end

live_loop :base, sync: :bd do
  ##| use_random_seed 4000
  use_synth :fm
  c = [:c3-5,:c3-5, :c3-2, :c3, :c3-5].ring
  ##| c = [:c3,:c3-5,:c3-2].shuffle
  
  sl = [0.25, 0.25, 0.125, 0.25, 0.25].ring
  
  sleep 2
  5.times do
    play c.tick, sustain: 0.125, release: 0
    sleep sl.look
  end
  sleep 2-(0.25*4)-0.125
end
