use_bpm 45

drum = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_drum\ loops/LCKK_drum\ loops\ full"

live_loop :bd do
  sleep 0.5
  ##| sample :bd_haus
end

live_loop :cymbal_close, sync: :bd do
  sleep 0.25
  sample :drum_cymbal_closed, amp: [3, 1].tick, attack: 0.02, rate: 1.4
end

live_loop :drum, sync: :bd do
  num = 14 # 3, 9 14
  sample drum ,num, beat_stretch: 4, amp: 2
  sleep 4
end

live_loop :string, sync: :bd do
  note = [:ds3, :d3].ring
  cd = [:M7, :m7].ring # 2番目が :m9 もいい
  
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

base_effect = [0,7].ring
live_loop :base, sync: :bd do
  base_effect.tick
  use_synth :tri
  2.times do
    3.times do
      synth :tri, note: :ds1+base_effect.look, release: 0.376, sustain: 0,attack_level: 3, amp: 4
      ##| synth :fm, note: :ds1+base_effect.look+12, release: 0.375, sustain: 0, amp: 1
      synth :tech_saws, note: :ds1+base_effect.look+12, release: 0.375, sustain: 0, amp: 1
      sleep 0.375
    end
    sleep 2 - 0.375*3
  end
end
