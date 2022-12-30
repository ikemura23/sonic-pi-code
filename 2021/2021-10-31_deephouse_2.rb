# output https://twitter.com/ikemura23/status/1454828635886477319

drum = "/Users/k_ikemura/Music/sonic_pi/LCA_kick_snare loops"
drum2 = "/Users/k_ikemura/Music/sonic_pi"
noise = "/Users/k_ikemura/Music/sonic_pi/LCCPTL_GRIME/LCCPTL_fx\ loops"
use_bpm 75

live_loop :kick do
  sample :bd_haus, amp: 3
  sleep 0.5
end

live_loop :drum_sample, sync: :kick do
  ##| sample drum, 4 ,beat_stretch: 8, amp: 1 ,hpf: 50, start: 0, finish: 0.5
  sleep 4
end

live_loop :drum_sample2, sync: :kick do
  sample drum2, 0, beat_stretch: 8, amp: 2, start: 0, finish: 0.5, hpf: 100
  sleep 4
end

base_amp = 3 #3
notes_base = ring(:g1,:e1) #:d1,:f1)
live_loop :base, sync: :kick do
  use_synth :chiplead #:dpulse :chiplead
  ##| with_fx :lpf, cutoff: 130 do
  4.times do
    sleep 0.25
    play notes_base.tick, amp: base_amp, release: 0, sustain: 0.25
    sleep 0.5
    play notes_base.look, amp: base_amp, release: 0, sustain: 0.25
    sleep 0.25
  end
  ##| end
end

notes = [:g3, :b3, :e3].ring # :b3 :e3
mero_amp = 3 #3

live_loop :mero, sync: :kick do
  detune = 0.2
  with_fx :reverb, room: 0.9, mix: 0.6 do
    use_synth :piano # :piano, :sine
    
    3.times do
      n = notes.tick
      play chord(n, :m7), release: 4, sustain: 2, amp: mero_amp
      play chord(n+detune, :m7), release: 4, sustain: 2, amp: mero_amp
      sleep 0.75
    end
    sleep 2.5-0.75
  end
end


# live_loop :noise, sync: :kick  do
#   ##| sleep 8
#   sleep 0.25
#   with_fx :reverb do
#     with_fx :slicer, phase: 0.5,amp_min: 0.1 do
#       ##| synth :noise, release: 12, cutoff: 100
#     end
#   end
#   sleep 15.75
# end

##| live_loop :ambient, sync: :kick do
##|   sleep 0.25
##|   with_fx :slicer, phase: 0.5 do
##|     sample noise, 8,beat_stretch: 8,  amp: 2 # 4 6 8
##|   end
##|   sleep 7.75
##| end
