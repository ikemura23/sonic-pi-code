drum = "/Users/k_ikemura/Music/sonic_pi/LCA_drum loops"
synth_loop = "/Users/k_ikemura/Music/sonic_pi/LCC_CHELL_HOUSE/synth_loops"
##| use_bpm 80

live_loop :kick do
  ##| sample :bd_haus, amp: 3
  sleep 0.5
end

live_loop :splash, sync: :kick do
  with_fx :reverb do
    sample :drum_splash_hard
  end
  sleep 16
end

live_loop :drum, sync: :kick do
  sample drum, 8,beat_stretch:8 , amp: 1, start: 0, finish: [1, 0.75].ring.tick
  sleep 8
end


base_note = (scale :c1, :minor_pentatonic, num_octaves: 1)
base_sleep = [0.25, 0.125]
base_amp = 1
live_loop :base, sync: :kick do
  ##| use_synth :dsaw #:sine :chiplead
  use_random_seed [60001, 7000, 400000, 3200, 3400, 3500].choose
  16.times do
    sl = base_sleep.choose
    n = base_note.choose
    
    synth :square, note: n, amp: base_amp, release: 0.05, sustain: 0.1
    synth :fm, note: n+12, amp: base_amp, release: 0, sustain: 0.1
    ##| synth :subpulse, note: n+12, amp: base_amp, release: 0, sustain: 0.125 # :dsaw :subpulse :sine
    sleep sl
  end
end
