#output https://twitter.com/ikemura23/status/1521033337501933574

hatLoop="/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_drum\ loops/LCKK_hat\ loops"
clap = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_claps"

live_loop :kick do
  sleep 0.5
  sample :bd_tek, amp: 1.1, lpf: 130#, rate: 0.8
end

live_loop :hatLoop, sync: :kick do
  sample hatLoop, 2, beat_stretch: 4, amp: 1, hpf: 90
  sleep 4
end

live_loop :clap, sync: :kick do
  sleep 0.5
  with_fx :reverb do
    sample clap, 5, amp: 1, lpf: 110
  end
  sleep 0.5
end

live_loop :midle, sync: :kick do
  use_synth :saw
  
  c = chord_invert(chord(:g2+9, :m9), 0)
  
  with_fx :reverb, room: 0.5, mix: 0.7 do
    ##| with_fx :echo,phase: 0.375, decay: 3, pre_mix: 0.9 do
    ##|   with_fx :wobble, cutoff_max: rrand(90, 120), wave: 1, invert_wave: 0 do
    ##|     play c, sustain: 0.25, release: 0
    ##|   end
    ##| end
    
    use_synth :mod_saw
    play chord_invert(chord(:g4+9, :m9), -1), release: 1.5, attack: 0.25
    
    sleep 2
    
    with_fx :wobble, cutoff_max: rrand(120, 130) do
      use_synth :beep
      play c-2,  sustain: 0.25, release: 0
      sleep 2
    end
  end
end

live_loop :midle2, sync: :kick do
  use_synth :subpulse #:prophet
  
  c = chord_invert(chord(:g3+7, :m11), 0)
  sleep 1.5
  4.times do
    with_fx :reverb, mix: 0.1, room: 0.5 do
      play c, sustain: 0.1, release: 0, attack: 0.1/2
      sleep 0.125
    end
  end
end

live_loop :pico, sync: :kick do
  use_synth :subpulse
  4.times do
    sleep 0.25
    play :g5+12, release: 0.1, sustain: 0, amp: 0.5
    sleep 0.25
  end
end

live_loop :base, sync: :kick do
  use_synth :dsaw
  key = :g1
  amp = 0.7
  
  with_fx :reverb, amp: amp do
    with_fx :lpf, cutoff: 100 do
      n = key
      sleep 0.25
      play n, sustain: 0.125, release: 0
      sleep 0.25
      play n, sustain: 0.125, release: 0
      sleep 0.25
      
      play n, sustain: 0.125, release: 0
      sleep 0.125
      play n+7, sustain: 0.125, release: 0
      sleep 0.25
      
      play n, sustain: 0.125, release: 0
      sleep 0.125
      
      sleep 2-0.25*4-0.125*2
      
      sleep 0.75
      
      play n, sustain: 0.125, release: 0
      sleep 0.125
      play n+7, sustain: 0.125, release: 0
      sleep 0.25
      
      play n, sustain: 0.125, release: 0
      sleep 0.125
      sleep 2-1-0.25
    end
  end
end
