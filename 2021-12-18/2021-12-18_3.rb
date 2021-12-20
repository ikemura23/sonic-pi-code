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

live_loop :pico, sync: :bd do
  use_synth :sine
  4.times do
    sleep 0.375
    play :g5+7, release: 0.1, sustain: 0, amp: 0.4
  end
  sleep 2-0.375*4
end

live_loop :string, sync: :bd do
  with_fx :hpf, cutoff: 50 do
    c = chord(:d3, :m9)
    with_fx :wobble, phase: 2 do
      sy2 = :dsaw #:hollow :dsaw
      sy2_amp = 1
      
      3.times do
        sleep 0.25
        synth :piano, note: c, amp: 2
        synth sy2, note: c, release: 2, amp: sy2_amp #:hollow :dsaw
        sleep 2-0.25
      end
      
      sleep 0.25
      synth :piano, note: c, amp: 2
      synth sy2, note: c, release: 0.75, amp: sy2_amp
      sleep 0.5
      synth :piano, note: c+2, amp: 2
      synth sy2, note: c+2, release: 1.25, amp: sy2_amp
      sleep 1.25
      
    end
  end
end

live_loop :base, sync: :bd do
  ##| stop
  use_random_seed 3400
  use_synth :dsaw
  with_fx :wobble, phase: 16, invert_wave: [1,0].ring.tick, wave: 0, amp: 0.7 do
    c = [:a1, :a1+5, :a1+7 ,:a1+12].shuffle
    
    sl = [0.125].shuffle
    
    64.times do
      play c.tick, sustain: 0.1, release: 0.05, amp: [1,0.5].choose , cutoff: [100, 70].choose
      sleep sl.look
    end
  end
end
