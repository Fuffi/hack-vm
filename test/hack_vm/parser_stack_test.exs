defmodule HackVm.ParserStackTest do
  use ExUnit.Case
  alias HackVm.Parser

  test "parses push command" do
    line = "push constant 0"
    expected = %Parser.StackCommand{type: :push, segment: :constant, index: 0}
    assert Parser.parse_line(line) == expected
  end

  test "parses pop command" do
    line = "pop constant 0"
    expected = %Parser.StackCommand{type: :pop, segment: :constant, index: 0}
    assert Parser.parse_line(line) == expected
  end
end
