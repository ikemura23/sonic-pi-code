use_bpm 62

effect = 0

live_loop :met do
  sleep 1
end

define :pattern do |pattern|
  return pattern.ring.tick == "x"
end

live_loop :kick, sync: :met do
  ##| stop
  a = 1.5
  sample :bd_tek, amp: a, cutoff: 130
  sleep 0.5
end

with_fx :echo, mix: 0.2 do
  with_fx :reverb, mix: 0.7, room: 0.7 do
    live_loop :clap, sync: :met do
      cmaster1 = 100
      ##| stop
      a = 0.75
      sleep 0.5
      sample :drum_snare_hard, rate: 1.5, cutoff: cmaster1, amp: a
      sample :drum_snare_hard, rate: 1.2, start: 0.02, cutoff: cmaster1, pan: 0.2, amp: a
      sample :drum_snare_hard, rate: 1, start: 0.04, cutoff: cmaster1, pan: -0.2, amp: a
      sleep 0.5
    end
  end
end

with_fx :reverb, mix: 0.2 do
  with_fx :panslicer, mix: 0.2 do
    live_loop :hhc1, sync: :met do
      ##| stop
      a = 0.9
      p = [-0.3, 0.3].choose
      sample :drum_cymbal_closed, amp: a, rate: 1.2, finish: 0.5, pan: p, cutoff: 130 if pattern "x-x-x-xx"
      sleep 0.125
    end
  end
end

with_fx :hpf, cutoff: 100 do
  live_loop :hh2, sync: :met do
    ##| stop
    a = 0.8
    at = 0
    sleep 0.25
    sample :drum_cymbal_open, cutoff: 110, rate: 1.2, start: 0.01, finish: 0.2, amp: a,attack: at
    sleep 0.25
  end
end

live_loop :low, sync: :met do
  a = 5
  synth :hollow, note: chord(:b5+7+effect, :maj9), release: 1, sustain: 4, amp: a
  sleep 4
  synth :hollow, note: chord(:b5+5+effect, :maj9), release: 1, sustain: 4, amp: a
  sleep 4
end

with_fx :reverb, mix: 0.6, room: 0.6 do
  live_loop :pico, sync: :met do
    ##| stop
    use_random_seed 2000
    a = 0.5
    
    c1 = chord(:b4+effect, :maj9, invert: -1).reverse.take(3)
    c2 = chord(:b4-2+effect, :maj9, invert: -1).reverse.take(3)
    
    2.times do
      tick_reset
      8.times do
        synth :dpulse, note: c1.tick, release: 0.12, amp: a
        sleep 0.25
      end
    end
    
    2.times do
      tick_reset
      8.times do
        synth :dpulse, note: c2.tick, release: 0.12, amp: a
        sleep 0.25
      end
    end
    
    ##| 32.times do
    ##|   synth :pulse, note: c1.tick, release: 0.125, amp: a if pattern "x--x--x-xx--x--x--x--x--"
    ##|   sleep 0.125
    ##| end
    
    ##| 32.times do
    ##|   synth :pulse, note: c2.tick, release: 0.125, amp: a if pattern "x--x--x-xx--x--x--x--x--"
    ##|   sleep 0.125
    ##| end
  end
  
  live_loop :base, sync: :met do
    use_synth :fm
    a = 1.5
    n = :b2+effect
    4.times do
      play n, sustain: 0.375, release: 0, amp: a
      sleep 0.375
      play n, release: 0.125, sustain: 0, amp: a
      sleep 0.125
      play n, release: 0, sustain: 0.25, amp: a
      sleep 0.25
      play n-5, release: 0, sustain: 0.25, amp: a
      sleep 0.25
    end
    n=n-2
    4.times do
      play n, sustain: 0.375, release: 0, amp: a
      sleep 0.375
      play n, release: 0.125, sustain: 0, amp: a
      sleep 0.125
      play n, release: 0, sustain: 0.25, amp: a
      sleep 0.25
      play n-5, release: 0, sustain: 0.25, amp: a
      sleep 0.25
    end
  end
  
  live_loop :mero, sync: :met do
    c1 = chord(:b3+effect, :maj9, invert: -1)
    c2 = chord(:b3-2+effect, :maj9, invert: -1)
    
    s = :sine
    a = 3
    use_synth :sine
    p = "x--x--x-" # "x--x----" "x-x--x-x-x-xx-x-"
    
    32.times do
      play c1, release: 0.18, attack_level: 2, amp: a if pattern p
      sleep 0.125
    end
    
    32.times do
      play c2, release: 0.18, attack_level: 2, amp: a if pattern p
      sleep 0.125
    end
  end
end
