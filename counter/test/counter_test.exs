defmodule CounterTest do
  use ExUnit.Case
  test "inc increment an integer value" do
    assert Counter.Core.inc(1) == 2
  end
end
