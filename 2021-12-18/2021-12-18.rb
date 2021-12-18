#output https://twitter.com/ikemura23/status/1472026637311311875

use_bpm 50

drum = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_drum\ loops/LCKK_top\ loops"
clap = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_claps"

live_loop :bd do
  sleep 0.5
  sample :bd_tek
end

live_loop :cymbal_close, sync: :bd do
  sleep 0.25
  sample :drum_cymbal_closed, amp: 1.2, attack: 0.02, rate: 3
  sleep 0.125
  sample :drum_cymbal_closed, amp: 1.2, attack: 0.02, rate: 3
  sleep 0.125
end

live_loop :clap, sync: :bd do
  sleep 0.5
  sample clap, 1, amp: 0.6
  sleep 0.5
end

live_loop :string, sync: :bd do
  with_fx :hpf, cutoff: 50 do
    invert = [0,1,2].first
    ef = [0, 5].ring
    c = chord_invert(chord(:g2, :m9), 0)
    2.times do
      n = c+ef.tick
      synth :piano, note: n, amp: 2
      synth :hollow, note: n, release: 4, amp: 6
      sleep 4
    end
  end
end

live_loop :base1, sync: :bd do
  use_random_seed 3400
  use_synth :fm
  c = [:g2,:g2-5,:g2-2].shuffle
  sl = [0.25, 0.25, 0.125, 0.25, 0.25]
  
  sleep 2
  5.times do
    play c.tick, sustain: 0.125, release: 0, amp: 1
    sleep sl.ring.look
  end
  sleep 2-sl.sum
end

live_loop :pico, sync: :bd do
  use_synth :sine
  2.times do
    sleep 0.375
    play :g4+7, release: 0.1, sustain: 0, amp: 0.5
  end
  sleep 1-0.375*2
end


##| live_loop :base2, sync: :bd do
##|   sy1 = :fm # :fm
##|   sy2 = :sine # :chiplead
##|   cd = [:g2,:g2-2].ring

##|   2.times do
##|     c = cd.tick
##|     with_fx :distortion, distort: 0.3, amp: 1.3 do
##|       sleep 0.25
##|       sleep 0.125

##|       synth sy1, note: c, sustain: 0.125, release: 0
##|       synth sy2, note: c-12, sustain: 0.125, release: 0, amp: 1
##|       sleep 0.125

##|       c = cd.tick
##|       sleep 0.25

##|       synth sy1, note: c, sustain: 0.125, release: 0
##|       synth sy2, note: c-12, sustain: 0.125, release: 0, amp: 1
##|       sleep 0.125

##|       sleep 1-0.25*2-0.125*3
##|     end
##|   end
##| end
