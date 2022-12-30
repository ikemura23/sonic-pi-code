use_bpm 70
drum2 = "/Users/k_ikemura/Music/sonic_pi/LCC_CHELL_HOUSE/drum_loops/LCC_hat loops"

live_loop :kick do
  sleep 0.5
  sample :bd_haus, lpf: 100, amp: 1.5
end

live_loop :drum, sync: :kick do
  sample drum2, 4, beat_stretch:8, amp: 1, hpf: 70, start: 0, finish: 0.5
  sleep 4
end

live_loop :ambient, sync: :kick do
  ##| sample :ambi_sauna, beat_stretch: 5, lpf: 80, amp: 4
  ##| sleep 16
  sleep 16
end

notes_base = ring(:g1,:d1)
effect = 0
base_amp = 1
piano_amp = 0
mero2_amp = 0
mero3_amp = 0

live_loop :base, sync: :kick do
  use_synth :chiplead
  with_fx :lpf, cutoff: 120 do
    4.times do
      sleep 0.25
      play notes_base.tick+effect, amp: base_amp, release: 0, sustain: 0.25
      sleep 0.25
      sleep 0.25
      play notes_base.look+effect, amp: base_amp, release: 0, sustain: 0.25
      sleep 0.25
    end
  end
end


live_loop :cd, sync: :kick do
  use_synth :sine
  2.times do
    play chord(:a3+effect, :m9), release: 0, sustain: 0.75
    sleep 0.75
    play chord(:g3+effect, :m9), release: 0, sustain: 1.25
    sleep 1.25
  end
end

live_loop :string, sync: :kick do
  use_synth :piano
  ##| with_fx :echo, phase: 1, mix: 0.5 do
  with_fx :reverb, amp: piano_amp, room: 1, mix: 0.7 do
    sleep 2
    play :d5+effect, release: 0.25, sustain: 0.75
    sleep 0.75
    play :a4+effect, release: 1.25, sustain: 0.75
    sleep 1.25
    
    sleep 2
    play :g5+effect, release: 0.25, sustain: 0.75
    sleep 0.75
    play :e5+effect, release: 1.25, sustain: 0.75
    sleep 1.25
  end
  ##| end
end

detune = 0.07
live_loop :piano2, sync: :kick do
  use_synth :blade #:prophet :blade
  with_fx :reverb, amp: mero2_amp, room: 0.9, mix: 0.7 do
    ##| synth :zawa, wave: 1, phase: 0.25, release: 5, note: :e4, cutoff: (line 70, 120, steps: 6).look, amp: 2
    play :e4+effect
    play :e4+effect+detune
    sleep 3
    play :c4+effect
    play :c4+effect+detune
    sleep 0.5
    play :d4+effect
    play :d4+effect+detune
    sleep 0.5
    
    play :e4+effect
    play :e4+effect+detune
    sleep 4
  end
end

live_loop :piano3, sync: :kick do
  use_synth :zawa
  with_fx :reverb, amp: mero3_amp, room: 0.8, mix: 0.8 do
    play :b3+effect
    sleep 3.5
    play :a3+effect
    sleep 0.5
    play :b3+effect
    sleep 0.75
    play :e4+effect
    sleep 0.75
    play :d4+effect #+4
    sleep 2.5
  end
end