# output https://twitter.com/ikemura23/status/1468616349866131456
use_bpm 45

drum = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_drum\ loops/LCKK_drum\ loops\ full"

live_loop :bd do
  sleep 0.5
  sample :bd_haus, cutoff: 80, amp: 1.2
end

live_loop :cymbal_close, sync: :bd do
  sleep 0.25
  sample :drum_cymbal_closed, amp: 1, attack: 0.02, rate: 1.4
  sleep 0.25
end

live_loop :drum, sync: :bd do
  num = 9 # 3, 9 14
  ##| sample drum ,num, beat_stretch: 4, amp: 1, start: 0.25, finish: 0.5
  sleep 1
end

live_loop :string, sync: :bd do
  note = [:ds3, :d3].ring
  cd = [:M7, :m7].ring
  
  with_fx :hpf, cutoff: 50 do
    2.times do
      note.tick
      c = chord(note.look, cd.look)
      ##| c = [[51, 55, 58, 62], [50, 53, 58, 62]].ring.tick
      ci = chord_invert(c, 2)
      
      synth :hollow, note: c, release: 5, attack: 1.5, amp: 5
      synth :sine, note: ci, release: 4, attack: 1.5, cutoff: 90, amp: 1
      sleep 4
    end
  end
end

base_effect = [0,-1].ring
live_loop :base, sync: :bd do
  base_effect.tick
  use_synth :tri
  2.times do
    3.times do
      synth :tri, note: :ds1+base_effect.look, release: 0.376, sustain: 0,attack_level: 3
      synth :fm, note: :ds2+base_effect.look, release: 0.375, sustain: 0, amp: 1
      synth :tech_saws, note: :ds2+base_effect.look, release: 0.375, sustain: 0, amp: 1
      sleep 0.375
    end
    sleep 2 - 0.375*3
  end
end

live_loop :mero, sync: :bd do
  use_synth :supersaw
  cd = [:ds3, :d3].ring
  note = [:M7, :m7].ring
  cd.tick
  sleep 0.75
  1.times do
    play chord_invert(chord(cd.look+7, note.look),3), release: 2
    sleep 4-0.75
  end
end

live_loop :arpeggios,sync: :bd do
  cd = [:ds3, :d3].ring
  note = [:M7, :m7].ring
  use_synth :dtri
  with_fx :reverb do
    2.times do
      play_pattern_timed chord(:ds3, :M7), 0.125, release: 0.125, cutoff: 80, amp: 1
      sleep 2-(0.125*4)
    end
    2.times do
      play_pattern_timed chord(:d3, :m7), 0.125, release: 0.125,cutoff: 80, amp: 1
      sleep 2-(0.125*4)
    end
  end
end