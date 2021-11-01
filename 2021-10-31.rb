use_bpm 70
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
base_amp = 2

live_loop :base, sync: :kick do
  use_synth :pulse #:dpulse ,:hoover, :prophet
  
  
  with_fx :lpf, cutoff: 60 do
    
    with_fx :slicer, phase: 0.375 do
      play base_notes.tick ,amp: base_amp, release: 0, sustain: 1.5
      sleep 2
    end
  end
  
end

notes = [:g3, :b3, :e3, :g3].ring
mero_amp = 2

live_loop :mero, sync: :kick do
  detune = 0.2
  with_fx :reverb, room: 0.9, mix: 0.5 do
    use_synth :piano # :piano, :sine
    
    4.times do
      n = notes.tick
      play chord(n, :m7), release: 4, sustain: 2, amp: mero_amp
      play chord(n+detune, :m7), release: 4, sustain: 2, amp: mero_amp
      sleep 0.75
    end
    sleep 1
    sleep 4
  end
end
