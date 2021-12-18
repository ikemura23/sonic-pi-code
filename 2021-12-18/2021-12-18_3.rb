use_bpm 65

drum = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_drum\ loops/LCKK_top\ loops"
clap = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_claps"

live_loop :bd do
  sleep 0.5
  sample :bd_tek
end

live_loop :cymbal_close, sync: :bd do
  sleep 0.25
  sample :drum_cymbal_open, amp: 0.5, beat_stretch: 0.5
  sleep 0.25
end

live_loop :clap, sync: :bd do
  sleep 0.5
  sample clap, 2, amp: 1.5
  sleep 0.5
end

live_loop :string, sync: :bd do
  with_fx :hpf, cutoff: 50 do
    c = chord(:d3, :m9)
    ef = [0, 5].ring
    2.times do
      with_fx :wobble, phase: 2 do
        sleep 0.25
        synth :piano, note: c, amp: 2
        synth :hollow, note: c, release: 2, amp: 6 #:hollow :dsaw
        sleep 2-0.25
      end
    end
  end
end

live_loop :base1, sync: :bd do
  use_random_seed 3400
  use_synth :tb303
  with_fx :wobble, phase: 16,invert_wave: [1,0].ring.tick, wave: 0 do
    c = [:a1, :a1+5, :a1+7 ,:a1+12].shuffle
    
    sl = [0.25, 0.125,0.125, 0.25].shuffle
    
    32.times do
      play c.tick, sustain: 0.1, release: 0.05, amp: [1,0.3].choose , cutoff: [100, 70].choose
      sleep sl.look
    end
  end
end
