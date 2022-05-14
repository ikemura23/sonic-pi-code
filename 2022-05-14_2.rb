#output https://twitter.com/ikemura23/status/1525482991455064064

hatLoop="/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_drum\ loops/LCKK_hat\ loops"
clap = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_claps"

live_loop :kick do
  sleep 0.5
  sample :bd_tek, amp: 1.4, lpf: 120
end

live_loop :hatLoop, sync: :kick do
  sample hatLoop, 13, beat_stretch: 4, amp: 1.2, lpf: 110 # 4
  sleep 4
end

live_loop :clap, sync: :kick do
  sleep 0.5
  with_fx :reverb do
    sample clap, 8, amp: 1, lpf: 110
  end
  sleep 0.5
end

live_loop :string, sync: :kick do
  use_synth :hollow
  play chord(:d4, :M7), sustain: 4, release: 0, amp: 1.2
  with_fx :slicer, phase: 0.375 do
    play chord(:d3, :M7), sustain: 4, release: 0, amp: 3.5
  end
  sleep 4
end

live_loop :backing, sync: :kick do
  use_synth :saw
  use_random_seed 7600
  r = [0.25, 0.375]
  with_fx :reverb do
    8.times do
      with_fx :lpf, cutoff: rrand_i(80, 120) do
        with_fx :wobble, phase: 8, wave: 3 do
          play chord_invert(chord(:d4, :M7), -2), release: 0.1, amp: 1.6
          sleep r.choose
        end
      end
    end
  end
end

live_loop :backing_echo, sync: :kick do
  use_synth :sine # :sine
  with_fx :reverb, room: 1 do
    with_fx :echo, decay: 6, phase: 0.375 do
      
      with_fx :lpf, cutoff: 90 do
        play chord_invert(chord(:d5+[0,0,7].choose, :M7), (range -1,3).tick), release: 0.125, amp: 1
        sleep 4
      end
      
    end
  end
end
