defmodule Random do

  def between(min, max) do
    seed()
    :random.uniform(max - min + 1) + min - 1
  end

  def seed do
    <<a::size(32), b::size(32), c::size(32)>> = :crypto.rand_bytes(12)
    :random.seed {a, b, c}
  end
end
