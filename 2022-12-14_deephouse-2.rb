# output https://twitter.com/ikemura23/status/1603027524807950338
use_debug false
use_bpm 60

clap = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_claps"
hat = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_hats"

kick_hat_frag = 1
clap_frag = 1

live_loop :met do
  sleep 1
end

with_fx :reverb, room: 0.2 do
  live_loop :kick, sync: :met do
    if kick_hat_frag < 1 then stop end
    a = 1.2
    
    sample :bd_tek, rate: 1, amp: a
    sleep 0.5
  end
  
  
  live_loop :hhc1, sync: :met do
    if kick_hat_frag < 1 then stop end
    sleep 0.25
    sample hat, 14, amp: 0.5, rate: 1.5
    sleep 0.25
  end
  
  live_loop :hhc2, sync: :met do
    if kick_hat_frag < 1 then stop end
    
    sample hat, 8, amp: 0.5, rate: 1.5
    sleep 0.25
  end
  
  live_loop :hhc3, sync: :met do
    if kick_hat_frag < 1 then stop end
    
    sample hat, 1, amp: 0.3, rate: 2
    sleep 0.125
    
  end
  
  live_loop :clap, sync: :met do
    if clap_frag < 1 then stop end
    
    a = 0.8
    no = 0
    
    sleep 0.5
    sample clap, no, amp: a, lpf: 120
    sleep 0.5
    
    ##| sleep 0.125
    ##| sample clap, no, amp: a, lpf: 120
    ##| sleep 0.375
    ##| sample clap, no, amp: a, lpf: 120
    ##| sleep 1-0.375-0.125
    
    ##| sleep 0.5
    ##| sample clap, no, amp: a, lpf: 120
    ##| sleep 0.5
    
    ##| sleep 0.125
    ##| sample clap, no, amp: a, lpf: 120
    ##| sleep 0.375
    
    ##| sample clap, no, amp: a, lpf: 120
    ##| sleep 0.25
    ##| sample clap, no, amp: a, lpf: 120
    ##| sleep 0.125
    ##| sample clap, no, amp: a, lpf: 120
    ##| sleep 0.125
  end
  
end

# -----

live_loop :base, sync: :met do
  ##| stop
  sl = [0.5,0.375, 0.375, 0.375, 0.25, 0.125]
  ef = [0, 0, -3, -1]
  with_fx :reverb, mix: 0.5, room: 0.5 do
    
    ef.size.times do |i|
      sl.size.times do
        synth :fm, note: :d2+ef[i], release: 0.3,  amp: 1.7, cutoff: 130
        ##| synth :dsaw, note: :d2+ef[i], release: 0.3,  amp: 1, cutoff: 70
        sleep sl.tick
      end
    end
  end
end

live_loop :base_long, sync: :met do
  stop
  ef = [0, 0, -3, -1]
  synth :bass_foundation, note: :d1+ef.tick, release: 0, sustain: 2,  amp: 1#, cutoff: 130
  sleep 2
end

# -----

live_loop :mero, sync: :met do
  ##| stop
  use_random_seed 100
  sl = [0.5,0.375,0.375,0.375, 0.375
        ]
  cds1 = [
    chord(:d3, :M7, invert: 2),
    chord(:d3, :M7, invert: 2),
    chord(:d3-3, :m9, invert: 0),
    chord(:d3-1, :m9, invert: 2),
  ]
  cds2 = [
    chord(:d2, :M7, invert: 0),
    chord(:d2, :M7, invert: 0),
    chord(:d2-3, :m9, invert: 0),
    chord(:d2-1, :m9, invert: 0),
  ]
  with_fx :reverb, mix: 0.5, room: 0.5 do
    ##| with_fx :wobble, phase: 0.375 do
    cds1.size.times do |i|
      c = cds1[i]
      c2 = cds2[i]
      sl.size.times do
        synth :saw, note: c, release: 0.4, amp: 1
        synth :rodeo, note: c2+12, sustain: 0.25, release: 0, amp: 0.8
        sleep sl.tick
      end
    end
    ##| end
  end
end

live_loop :mero4, sync: :met do
  stop
  use_random_seed 100
  ##| sl = [0.5,0.375,0.375,0.375, 0.375
  cds1 = [
    chord(:d3, :M7, invert: 2),
    chord(:d3, :M7, invert: 2),
    chord(:d3-3, :m9, invert: 0),
    chord(:d3-1, :m9, invert: 2),
  ]
  cds2 = [
    chord(:d2, :M7, invert: 0),
    chord(:d2, :M7, invert: 0),
    chord(:d2-3, :m9, invert: 0),
    chord(:d2-1, :m9, invert: 0),
  ]
  with_fx :reverb, mix: 0.5, room: 0.5 do
    ##| with_fx :wobble, phase: 0.375 do
    cds1.size.times do |i|
      c = cds1[i]
      c2 = cds2[i]
      ##| sl.size.times do
      synth :sine, note: c, release: 2.5, amp: 1
      synth :rodeo, note: c2+12,release: 2.5, amp: 0.8, cutoff: 90
      sleep 2
    end
    ##| end
    ##| end
  end
end

live_loop :mero2, sync: :met do
  stop
  sleep 2
  with_fx :reverb, room: 0.5, mix: 0.7 do
    with_fx :echo, phase: 0.375, decay: 5 do
      synth :prophet, note: chord(:d4+[0,7].tick, :M7), release: 0.25, cutoff: 90, amp: 3
    end
    sleep 2+4
  end
end

live_loop :mero3, sync: :met do
  stop
  
  use_random_seed 100
  ##| sl = [0.5,0.375,0.375,0.375]
  sl = [0.5,0.375,0.25,0.25, 0.375, 0.25].shuffle
  
  with_fx :reverb, mix: 0.7, room: 0.7 do
    cd = chord(:d4+7, :M7, invert: 2)
    2.times do
      sl.size.times do
        c = cd.tick('cd')
        synth :prophet, note: c, release: 0.4, amp: 0.3
        synth :dtri, note: c, release: 0.4, amp: 0.5
        sleep sl.tick('sl')
      end
      sleep 2-sl.sum
    end
    
    cd = chord(:d4-3+7, :m9, invert: 2)
    tick_reset
    sl.size.times do
      c = cd.tick('cd')
      synth :prophet, note: c, release: 0.4, amp: 0.3
      synth :dtri, note: c, release: 0.4, amp: 0.5
      sleep sl.tick('sl')
    end
    sleep 2-sl.sum
    
    cd = chord(:d4-1+7, :m7, invert: 1)
    tick_reset
    sl.size.times do
      c = cd.tick('cd')
      synth :prophet, note: c, release: 0.4, amp: 0.3
      synth :dtri, note: c, release: 0.4, amp: 0.5
      sleep sl.tick('sl')
    end
    sleep 2-sl.sum
  end
  
end
# -----

live_loop :stings, sync: :met do
  stop
  with_fx :slicer, phase: 0.5, mix: 0.2 do
    s = synth :hollow, note: chord(:d5+7, :M7, invert: 0), release: 0, sustain: 4, cutoff: 130, amp: 2
    sleep 4
    synth :hollow, note: chord(:d5+7-3, :m9, invert: 0), release: 0, sustain: 2, cutoff: 130, amp: 2
    ##| control s, note: chord(:d5+7-3, :m9, invert: 0)
    sleep 2
    synth :hollow, note: chord(:d5+7-1, :m9, invert: 0), release: 0, sustain: 2, cutoff: 130, amp: 2
    sleep 2
  end
end
