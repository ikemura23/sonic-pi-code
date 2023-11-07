# inspier https://youtu.be/03UWJLQIWJg?si=pFE955u1QYgLrXSr&t=11

live_loop :met do
    sleep 0.5
  end
  
  live_loop :kick, sync: :met do
    use_sample_defaults amp: 1.1, lpf: 90
    sample :bd_tek # :bd_haus :bd_tek :bd_ada
    sleep 0.5
  end
  
  live_loop :chord, sync: :met do
    use_synth :dsaw
    use_synth_defaults release: 3
    
    sleep 0.75
    play chord(:a3, :M7)
    sleep 4-0.75
    
  end