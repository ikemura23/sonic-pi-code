# output https://twitter.com/ikemura23/status/1455726165310590977
use_bpm 65
drum = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_drum\ loops/LCKK_clap\ loops"

live_loop :kick do
  sample :bd_haus, amp: 2
  sleep 0.5
end

live_loop :drum_sample, sync: :kick do
  sample drum, 3, beat_stretch: 4, amp: 2, start: 0, finish: 0.5#, hpf: 98
  sleep 2
end

base_notes = ring(:g1,:g1, :bb1, :d2)
base_amp = 3

live_loop :base, sync: :kick do
  use_synth :pulse #:dpulse ,:hoover, :prophet
  
  with_fx :lpf, cutoff: 70 do
    with_fx :reverb do
      with_fx :slicer, phase: 0.375 do
        play base_notes.tick ,amp: base_amp, release: 0, sustain: 1.4
        sleep 2
      end
    end
  end
end

notes = [:g3, :b3, :e3, :g3].ring
mero_amp = 2
mero_release = 1.5
detune = 0.2

live_loop :mero, sync: :kick do
  with_fx :lpf, cutoff: 90 do
    with_fx :reverb, room: 0.4, mix: 0.3 do
      use_synth :prophet #, :prophet
      
      4.times do
        n = notes.tick
        play chord(n, :m7), release: mero_release, amp: mero_amp, decay: 0.08 #,attack: 0.03,
        play chord(n+detune, :m7), release: mero_release, amp: mero_amp, decay: 0.08 #,attack: 0.03,
        sleep 0.75
      end
      sleep 1
      sleep 4
    end
  end
end
