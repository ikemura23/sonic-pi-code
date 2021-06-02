# ゆめ未来 Sonic
# 動画
# https://www.youtube.com/watch?v=ow0CzpiV6zM

## part 1


use_bpm 70
drum = "/Users/k_ikemura/Music/sonic_pi/drum_slow"

cd = :a3

live_loop :drum do
  sample drum, 0,beat_stretch:8 , amp: 0.7, lpf: 100
  
  sleep 8
end

live_loop :back_cd do
  use_synth :prophet
  cds = (ring :a3, :g3).tick
  play chord(cds, :M7), release: 8, cutoff: 70
  sleep 8
end

live_loop :temp do
  with_fx :reverb, room: 1 do
    with_fx :reverb, room: 1 do
      ##| with_fx :echo, phase: 0.3, decay: 3 do
      use_random_seed 3800 # 3800 -> 13800 -> 5800
      
      ns = (scale cd+12, :hex_major7, num_octaves: 1)
      8.times do # 8 -> 4
        tick
        use_synth :piano
        play ns.choose, release: 1, amp: 0.5
        sleep 2 # 2 -> 1 -> 0.5
      end
    end
    ##| end
  end
end



## part 2

# drum = "/Users/k_ikemura/Music/sonic_pi/drum_slow"

# cd = :a3

# live_loop :chord, sync: :drum_bd do
#   use_synth :sine
  
#   with_fx :slicer, phase: 0.375 do
#     play chord(cd, :M7), sustain: 3.8, cutoff: 100, amp: 0.5
#   end
  
#   with_fx :slicer, phase: 0.125 do
#     ##| play chord(cd+7, :M7), sustain: 3.8, cutoff: 100, amp: 0.3
#   end
  
#   sleep 4
# end

# live_loop :industry, sync: :drum_bd do
#   ##| sample :loop_industrial, beat_stretch: 1, cutoff: 70, amp: 1
#   sleep 1
# end

# live_loop :drum_bd do
#   sample :bd_haus, lpf: 10
#   sleep 0.5
# end

# live_loop :mero, sync: :drum_bd do
#   with_fx :reverb, room: 0.8 do
#     ##| with_fx :echo do
#     ##| use_random_seed Time.new.usec
#     ##| with_fx :wobble, phase: 8, invert_wave: 1, amp: 2 do
#     with_fx :bitcrusher,amp: 0.4 do
      
#       use_synth :prophet
#       ns = (scale cd-12, :major_pentatonic, num_octaves: 2)
#       24.times do
#         tick
#         ##| play ns.choose, detune: (ring 12,-24,-36).choose, release: rrand(0, 0.2), amp: rand + 0.5, cutoff: rrand(70, 120),amp: 1
#         sleep 0.125
#       end
#       ##|     end
#       ##|   end
#     end
#   end
# end

