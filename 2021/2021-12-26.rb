drum = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_drum\ loops/LCKK_top\ loops"
clap = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_claps"

live_loop :bd do
  sleep 0.5
  sample :bd_tek, cutoff: 110, amp: 1.5
end

live_loop :cymbal_close, sync: :bd do
  
  with_fx :lpf, cutoff: 110 do
    sample :drum_cymbal_closed, amp: 1.3, attack: 0.02, rate: 2
    sleep 0.125
    sample :drum_cymbal_closed, amp: 1.3, attack: 0.02, rate: 2
    sleep 0.125
    ##| sample :drum_cymbal_closed, amp: 1.3, attack: 0.02, rate: 1
    sample :drum_cymbal_open, amp: 0.8, beat_stretch: 0.5
    sleep 0.125
    sample :drum_cymbal_closed, amp: 1.3, attack: 0.02, rate: 2
    sleep 0.125
  end
end

live_loop :clap, sync: :bd do
  sleep 0.5
  num = 3
  sample clap, num, amp: 0.6
  sleep 0.5
end

live_loop :sine, sync: :bd do
  ##| stop
  2.times do
    n = chord_invert(chord(:b4, :M7), 0)
    with_fx :wobble do
      with_fx :reverb, room: 0.8 do
        synth :pluck, note: n, release: 0.1, sustain: 0.25, amp: 1.5
        sleep 0.375
        synth :pluck, note: n, release: 0.1, sustain: 0.25, amp: 1.5
        sleep 0.25
        sleep 2-0.375-0.25
      end
    end
  end
end

live_loop :sine_solo, sync: :bd do
  
  c = chord_invert(chord(:b3, :M7), 1)
  synth :sine, note: c+2, release: 2, amp: 1.5
  sleep 1.75
  synth :sine, note: c, release: 4, amp: 1.5
  sleep 6+0.25
end

live_loop :base, sync: :bd do
  sy1 = :fm
  use_random_seed 59220 # 59220
  
  16.size.times do
    c = chord(:b1, :M7).shuffle.choose
    synth sy1, note: c, sustain: 0.25, release: 0.1, amp: 2
    sleep 0.25
  end
end

live_loop :hollow, sync: :bd do
  invert=  [0, 1, 2].choose
  synth :hollow, note: chord_invert(chord(:b2, :M7), invert), sustain: 3, release: 3, amp: 4
  sleep 3
end
