# Music Title: COSMIC EXPLORER
# https://youtu.be/McbGhBt3i3k

slc = :D3 #D,F,G,A

live_loop :amb do
  use_synth :hollow
  a = 4
  play chord(slc-12, :m11), sustain:16, attack:1, amp: a
  play chord(slc, :m11), sustain:16, attack:1, amp: a
  sleep 16
end

sl2 = [2,5,7,9]
live_loop :chorus2 do
  with_fx :wobble, wave: 3, invert_wave: 1, phase: 60 do
    with_fx :lpf, cutoff: 100 do
      use_synth :tech_saws
      ##| play chord(slc+12+sl2.tick, :m7), sustain:10, release: 20, attack: 10, amp: 0.8
      sleep 44
    end
  end
end
