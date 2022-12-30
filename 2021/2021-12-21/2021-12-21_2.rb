drum = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_drum\ loops/LCKK_top\ loops"
clap = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_claps"

live_loop :bd do
  sleep 0.5
  sample :bd_tek, cutoff: 100, amp: 1.3
end

live_loop :cymbal_close, sync: :bd do
  with_fx :lpf, cutoff: 110 do
    sample :drum_cymbal_closed, amp: 1.3, attack: 0.02, rate: 2
    sleep 0.125
    sample :drum_cymbal_closed, amp: 1.3, attack: 0.02, rate: 2
    sleep 0.125
    sample :drum_cymbal_closed, amp: 1.3, attack: 0.02, rate: 1
    ##| sample :drum_cymbal_open, amp: 0.8, beat_stretch: 0.5
    sleep 0.25
  end
end

live_loop :clap, sync: :bd do
  sleep 0.5
  num = 2
  sample clap, num, amp: 0.6
  sleep 0.5
end

##| live_loop :sine, sync: :bd do
##|   invert = [0,1,2].ring
##|   ef = [0, 3, 5, 7].ring
##|   2.times do
##|     c = chord_invert(chord(:e3, :M7), invert.tick)
##|     n = c+ef.look
##|     ##| synth :sine, note: n, release: 0.1, sustain: 0.25, amp: 1.5
##|     ##| sleep 0.375
##|     ##| synth :sine, note: n, release: 0.1, sustain: 0.25, amp: 1.5
##|     ##| sleep 0.25
##|     ##| sleep 2-0.375-0.25

##|     synth :sine, note: n, release: 2, amp: 1.5
##|     sleep 2
##|   end
##| end

live_loop :sine_solo, sync: :bd do
  ##| use_random_seed 59220
  invert = [0, 1, 2].ring
  ef = [0, 3, 5, 7, ].ring
  sl = [0.125,0.125,0.25,0.5,0.375, 0.125,0.5].shuffle # total 2
  ##| 14.times do
  ##|   c = chord_invert(chord(:e3, :M7), invert.tick)
  ##|   n = c+ef.look
  
  ##|   s = sl.look
  ##|   synth :sine, note: n, release: s, sustain: 0, amp: 1.5
  ##|   sleep s
  ##| end
  
  synth :sine, note: chord(:e3, :M7), release: 4, amp: 1.5
  sleep 4
end

live_loop :base, sync: :bd do
  sy1 = :fm
  c = :e2
  sl = [0.75, 0.375, 0.25, 0.25, 0.125]
  ##| sleep 4
  with_fx :distortion, distort: 0.3, amp: 1.3 do
    2.times do
      sleep 0.25
      sl.size.times do
        synth sy1, note: c, sustain: 0.125, release: 0.1
        sleep sl.tick
      end
      sleep 2-sl.sum-0.25
    end
  end
end
