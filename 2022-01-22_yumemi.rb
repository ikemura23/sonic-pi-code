#output https://twitter.com/ikemura23/status/1484701538660814849
use_bpm 70
drum = "/Users/k_ikemura/Music/sonic_pi/LCHZ_UK_DRILL/LCHZ_drum\ loops/LCHZ_drum\ loops\ full"

live_loop :bd do
  sleep 0.5
  ##| sample :bd_tek, amp: 1.5
end

live_loop :cymbal_close, sync: :bd do
  cymbal_amp = 2
  with_fx :lpf, cutoff: 130 do
    sample :drum_cymbal_closed, amp: cymbal_amp, attack: 0.02, rate: 1.8
    sleep 2
  end
end

live_loop :drum, sync: :bd do
  ##| sample drum, 6, beat_stretch: 8, amp: 1.5
  sleep 8
end

base_cd = [:D1, :E1].ring

live_loop :tech_saws, sync: :bd do
  synth :chiplead, note: base_cd.tick, sustain: 4, release: 0, cutoff: 120, amp: 0.5
  synth :fm, note: base_cd.look+12, sustain: 4, release: 0, cutoff: 120, amp: 1.6
  sleep 4
end

live_loop :strings, sync: :bd do
  n = chord_invert(chord(:D4, :sus2), 0)
  use_synth :hollow
  play n, sustain: 4, release: 0, amp: 3
  sleep 4
end

live_loop :pico1, sync: :bd do
  use_synth :subpulse #:supersaw
  note = chord_invert(chord(:e4-2, :sus2), 1)
  with_fx :reverb do
    ##| play note, amp: 1.5, release: 2, cutoff: 110
    sleep 4
  end
end

live_loop :pico2, sync: :bd do
  use_synth :dpulse
  sleep 2
  with_fx :reverb, room: 0.9 do
    with_fx :lpf, cutoff: 130 do
      play :b5, amp: 0.8, release: 2
    end
  end
  sleep 2
end

live_loop :pico3, sync: :bd do
  use_synth :pluck
  list = [86, 88, 92, 93]
  sleep 3
  with_fx :reverb, room: 0.8 do
    list.size.times do
      ##| play list.tick, amp: 6, release: 0, sustain: 0.1, cutoff: 130
      sleep 0.25
    end
  end
end
