use_bpm 70
drum2 = "/Users/k_ikemura/Music/sonic_pi"

# Welcome to Sonic Pi

live_loop :kick do
  sleep 0.5
  ##| sample :bd_haus, lpf: 100, amp: 1.5
end

live_loop :drum, sync: :kick do
  sample drum2, 4, beat_stretch:8, amp: 1, hpf: 100, start: 0, finish: 0.5
  sleep 4
end

live_loop :ambient, sync: :kick do
  sample :ambi_sauna, beat_stretch: 5, lpf: 80, amp: 2.5
  sleep 16
  sleep 16
end

notes_base = ring(:gb1,:db1)
effect = 0
base_amp = 1
piano_amp = 1.2

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
  play chord(:ab3+effect, :m9), release: 0, sustain: 0.75
  sleep 0.75
  play chord(:gb3+effect, :m9), release: 2.5, sustain: 0
  sleep 3.25
end

live_loop :string, sync: :kick do
  use_synth :piano
  ##| with_fx :echo, phase: 1, mix: 0.5 do
  with_fx :reverb, amp: piano_amp, room: 0.9, mix: 0.7 do
    sleep 2
    play :db5+effect, release: 0.25, sustain: 0.75
    sleep 0.75
    play :ab4+effect, release: 1.25, sustain: 0.75
    sleep 1.25
    
    sleep 2
    play :gb5+effect, release: 0.25, sustain: 0.75
    sleep 0.75
    play :eb5+effect, release: 1.25, sustain: 0.75
    sleep 1.25
  end
  ##| end
end

# 参考元: https://www.youtube.com/watch?v=Qzo0mpTmHzY