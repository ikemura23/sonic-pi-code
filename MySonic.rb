# My Sonic 完成形
# load_example :rerezzed

# Rerezzed
# Coded by Sam Aaron

use_debug false
use_random_seed 3000
notes = (scale :e1, :minor_pentatonic, num_octaves: 2).shuffle
# minor_pentatonic -> yu -> iwato -> bhairav -> ionian, 

live_loop :rerezzed do
  tick_reset
  t = 0.04
  sleep -t
  with_fx :bitcrusher do
    #bitcrusher -> ixi_techno -> krush -> mono
    s = synth :dsaw, note: :e3, sustain: 8, note_slide: t, release: 0, amp: 0.7, cutoff: 100
    # s2 = synth :dsaw, note: :e3, sustain: 8, note_slide: t, release: 0, amp: 0.7, cutoff: 100
    64.times do
      sleep 0.125
      control s, note: notes.tick
      # control s2, note: (octs :e3, 4).tick
    end
  end
  sleep t
end

live_loop :industry do
  sample :loop_industrial, beat_stretch: 1, lpf: 100
  sleep 1
end

live_loop :drive do
  sample :bd_haus, amp: 2
  sleep 0.5
end
