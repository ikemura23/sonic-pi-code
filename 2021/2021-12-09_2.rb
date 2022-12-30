
use_bpm 65

drum = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_drum\ loops/LCKK_drum\ loops\ full"

live_loop :bd do
  sleep 0.5
  sample :bd_tek
end

##| live_loop :cymbal_close, sync: :bd do
##|   sleep 0.25
##|   sample :drum_cymbal_closed, amp: [3, 1].tick, attack: 0.02, rate: 1.4
##| end

live_loop :drum, sync: :bd do
  ##| sample drum, 5, beat_stretch: 4, amp: 1.5
  sleep 4
end

live_loop :string, sync: :bd do
  with_fx :hpf, cutoff: 50 do
    invert = [-2,0,1,2].last
    c = chord_invert(chord(:ds3, :m9), invert)
    synth :hollow, note: c, release: 0, sustain: 16,  amp: 4
    ##| synth :hollow, note: c, release: 8,attack: 4, amp: 4
    sleep 16
  end
end

live_loop :sound, sync: :bd do
  invert = [0,1,2,3].first
  c = chord_invert(chord(:ds3, :m9),invert)
  sl = [0.125, -0.125]
  
  with_fx :reverb, mix: 0.7 do
    2.times do
      synth :dpulse, note: c, release: 0.125, amp: 3
      synth :saw, note: c, release: 0.125, amp: 3
      sleep 1+sl.first
      synth :dpulse, note: c, release: 0.125, amp: 3
      synth :saw, note: c, release: 0.125, amp: 3
      sleep 1+sl.last
    end
  end
end

live_loop :base, sync: :bd do
  use_synth :dtri
  with_fx :distortion, distort: 0.7 do
    with_fx :reverb do
      play_pattern_timed chord(:ds1, :m9), [0.125, 0.25,0.25,0.25], release: 0.125, amp: 2.5
      sleep 0.125
    end
  end
end
