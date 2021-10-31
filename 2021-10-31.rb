use_bpm 65
drum = "/Users/k_ikemura/Music/sonic_pi/LCA_kick_snare loops"
drum2 = "/Users/k_ikemura/Music/sonic_pi"

# Welcome to Sonic Pi

live_loop :kick do
  sample :bd_haus, amp: 2
  sleep 0.5
end

live_loop :drum_sample, sync: :kick do
  ##| sample drum, 11 ,beat_stretch:8, amp: 1  #,hpf: 50
  sleep 8
end

live_loop :drum_sample2, sync: :kick do
  sample drum2, 0, beat_stretch: 8, amp: 2, start: 0, finish: 0.5, hpf: 98
  sleep 4
end

base_notes = ring(:g1, :bb2, :d2)
base_amp = 2

live_loop :base, sync: :kick do
  use_synth :pulse #:dpulse ,:hoover, :prophet
  
  with_fx :lpf, cutoff: 60 do
    
    with_fx :slicer, phase: 0.375 do
      play base_notes.tick, amp: base_amp, release: 0, sustain: 2.9
    end
    sleep 4
    
    with_fx :slicer, phase: 0.375 do
      play base_notes.tick, amp: base_amp, release: 0, sustain: 1.5
    end
    sleep 2
    with_fx :slicer, phase: 0.375 do
      play base_notes.tick, amp: base_amp, release: 0, sustain: 1.5
    end
    sleep 2
    
    ##| 4.times do
    ##|   with_fx :slicer, phase: 0.375 do
    ##|     play base_notes.look, amp: base_amp, release: 0, sustain: 1
    ##|   end
    ##|   sleep 2
    ##| end
  end
  
end

notes = [:g3, :b3, :e3].ring
mero_amp = 2

live_loop :mero, sync: :kick do
  detune = 0.2
  with_fx :reverb, room: 0.9, mix: 0.5 do
    use_synth :piano # :piano, :sine
    
    3.times do
      n = notes.tick
      play chord(n, :m7), release: 4, sustain: 2, amp: mero_amp
      play chord(n+detune, :m7), release: 4, sustain: 2, amp: mero_amp
      sleep 0.75
    end
    
    sleep 1.75
    sleep 4
  end
end
