# normal
live_loop :met do
  sleep 0.5
end

live_loop :kick, sync: :met do
  use_sample_defaults amp: 1.1, lpf: 90
  sample :bd_tek # :bd_haus :bd_tek :bd_ada
  sleep 0.5
end