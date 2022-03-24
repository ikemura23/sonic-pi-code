drum = "/Users/k_ikemura/Music/sonic_pi/LCA_drum loops"
hat_loop="/Users/k_ikemura/Music/sonic_pi/LCC_CHELL_HOUSE/drum_loops/LCC_hat\ loops"

live_loop :kick do
  sample :bd_haus, amp: 3
  sleep 0.5
end

live_loop :drum, sync: :kick do
  sample hat_loop, 3, beat_stretch: 8 , amp: 1
  sleep 8
end

live_loop :splash, sync: :kick do
  with_fx :reverb do
    ##| sample :drum_splash_hard
  end
  sleep 16
end

live_loop :drum, sync: :kick do
  sample drum, 1,beat_stretch:8 , amp: 1, start: 0, finish: [1, 0.75].ring.tick
  sleep 8
end

hi_mero_note = (scale :c5, :chromatic, num_octaves: 1)
live_loop :mero, sync: :kick do
  use_synth :subpulse
  n = hi_mero_note.tick
  ##| play n, release: 0.125
  ##| play n+5, release: 0.125
  sleep 0.125
end

live_loop :nise, sync: :kick do
  use_synth :dpulse
  n = (scale :c5, :chromatic, num_octaves: 1).choose
  
  with_fx :flanger, amp: 0.2 do
    ##| play n,  attack: 8
    ##| play n-1, attack: 8
    sleep 12
  end
end

base_note = (scale :c1, :chromatic, num_octaves: 1)
base_sleep = [0.25, 0.125]
base_amp = 1
live_loop :base, sync: :kick do
  ##| use_random_seed [6001, 7000, 3400, 3500].choose
  16.times do
    sl = base_sleep.choose
    n = base_note.choose
    
    synth :square, note: n, amp: base_amp, release: 0.05, sustain: 0.1
    synth :fm, note: n+12, amp: base_amp, release: 0, sustain: 0.1
    synth :dpulse, note: n+31, amp: base_amp-0.5, release: 0.05, sustain: 0.1
    ##| synth :tb303, note: n+24, amp: base_amp-0.6, release: 0, sustain: 0.125 # :dsaw :subpulse :sine
    sleep sl
  end
end
