# https://twitter.com/ikemura23/status/1477492093908299776
drum = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_drum\ loops/LCKK_top\ loops"
clap = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_claps"

live_loop :bd do
  sleep 0.5
  sample :bd_haus, cutoff: 100, amp: 1.5
end

live_loop :cymbal_close, sync: :bd do
  cymbal_amp = 3
  with_fx :lpf, cutoff: 100 do
    sample :drum_cymbal_closed, amp: cymbal_amp, attack: 0.02, rate: 1.8
    sleep 0.125
    sample :drum_cymbal_closed, amp: cymbal_amp, attack: 0.02, rate: 1.8
    sleep 0.125
    ##| sample :drum_cymbal_closed, amp: cymbal_amp, attack: 0.02, rate: 1
    sample :drum_cymbal_open, amp: cymbal_amp, beat_stretch: 0.5
    sleep 0.125
    sample :drum_cymbal_closed, amp: cymbal_amp, attack: 0.02, rate: 1.8
    sleep 0.125
  end
end

live_loop :clap, sync: :bd do
  sleep 0.5
  sample clap, 1, amp: 0.8
  sleep 0.5
end

live_loop :string, sync: :bd do
  with_fx :hpf, cutoff: 50 do
    invert = [0,1,2].first
    c = chord_invert(chord(:d4, :m9), invert)
    synth :hollow, note: c, release: 2, amp: 3, attack: 6
    synth :hollow, note: c+7, release: 2, amp: 3, attack: 6
    sleep 8
  end
end


live_loop :sine_solo, sync: :bd do
  use_synth :dpulse
  c = chord_invert(chord(:d5, :m), 0)
  use_random_seed 88
  atk = 0.02
  with_fx :reverb, amp: 0.3 do
    with_fx :distortion do
      with_fx :bitcrusher do
        16.times do
          s = 0.125
          n = c.choose+[0, 5, 7].choose
          play n, release: s/2, amp:[1, 0.5].choose, attack: atk
          sleep s
          play :d4, release: s/2, amp:[1, 0.5].choose, attack: atk
          sleep s
        end
      end
    end
  end
end

live_loop :sine_solo2, sync: :bd do
  use_synth :subpulse
  key = :d4
  with_fx :reverb, amp: 0 do
    with_fx :distortion do
      with_fx :bitcrusher do
        play key+7, release: 0.375
        sleep 0.375
        play key, release: 0.375
        sleep 0.375
        play key+3, release: 0.375
        sleep 0.375
        sleep 3-0.375*3
        sleep 0.25
        play key, release: 0.25
        sleep 0.25
        play key+3, release: 0.25
        sleep 0.25
        play key+5, release: 0.25
        sleep 0.25
      end
    end
  end
end

live_loop :base, sync: :bd do
  use_synth :fm
  with_fx :krush do
    ##| with_fx :distortion do
    3.times do
      play :d2, sustain: 0.25, release: 0.1, amp: 1
      sleep 0.75
    end
    play :d2+3, sustain: 0.25, release: 0.1, amp: 1
    sleep 0.75
    play :d2+3, sustain: 0.25, release: 0.1, amp: 1
    sleep 0.5
    play :d2+5, sustain: 0.5, release: 0.1, amp: 1
    sleep 0.5
    ##| end
  end
end

##| live_loop :hollow, sync: :bd do
##|   c = chord_invert(chord(:b2, :M7), 0)
##|   synth :hollow, note: c+2, sustain: 1.75, release: 0, amp: 5
##|   sleep 1.75
##|   synth :hollow, note: c, sustain: 6.25, release: 0, amp: 5
##|   sleep 6+0.25
##| end
