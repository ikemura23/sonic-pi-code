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
      sample :drum_cymbal_closed, amp: a, rate: 1.2, finish: 0.5, pan: p, cutoff: 130 if pattern "x-x-xxxxx-x-x-xx"
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
  c = [:sus2]
  synth :hollow, note: chord(:e4+effect, c.tick), release: 2, sustain: 4, amp: 2, attack: 1
  ##| synth :saw, note: chord(:e5+effect, c.tick), release: 2, sustain: 4, amp: 0.5, attack: 1
  sleep 4
end

with_fx :reverb, mix: 0.6, room: 0.6 do
  ##| live_loop :base, sync: :met do
  ##|   use_random_seed 200 #200
  ##|   n = :e1+effect
  
  ##|   6.times do
  ##|     r = [0.25, 0.375].choose
  ##|     synth :dsaw, note: n, release: 0.25, amp: 2
  ##|     synth :fm, note: n+12, release: 0.25, amp: 2
  ##|     sleep r
  ##|   end
  ##| end
  
  live_loop :base2, sync: :met do
    synth :dsaw, note: :e1+effect, release: 0.125, amp: 2 if pattern "-xxx"
    sleep 0.125
  end
  
  live_loop :base3, sync: :met do
    synth :fm, note: :e2+effect, release: 0.125, amp: 2 if pattern "-xxx"
    sleep 0.125
  end
end

with_fx :reverb, mix: 0.7, room: 0.7 do
  live_loop :mero, sync: :met do
    use_random_seed 500 #400 500 600 800
    2.times do
      ##| r = [0.25, 0.375, 0.5].choose
      n = (chord(:e3+7, :m)+[:e3+12]).choose
      ##| synth :supersaw
      synth :saw, note: [n, n-[5,7].choose], release: 0.25, amp: 1.3 if pattern "x--x----"
      sleep 0.125
    end
  end
end
