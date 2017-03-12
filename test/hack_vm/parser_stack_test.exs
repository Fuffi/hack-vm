defmodule HackVm.ParserStackTest do
  use ExUnit.Case
  alias HackVm.Parser

  test "parses push command" do
    line = "push static 0"
    expected = %Parser.StackCommand{type: :push, segment: :static, index: 0}
    assert Parser.parse_line(line) == expected
  end

  test "parses pop command" do
    line = "pop static 0"
    expected = %Parser.StackCommand{type: :pop, segment: :static, index: 0}
    assert Parser.parse_line(line) == expected
  end

  test "parses constant segment" do
    line = "pop constant 0"
    expected = %Parser.StackCommand{type: :pop, segment: :constant, index: 0}
    assert Parser.parse_line(line) == expected
  end

  test "parses temp segment" do
    line = "pop temp 0"
    expected = %Parser.StackCommand{type: :pop, segment: :temp, index: 0}
    assert Parser.parse_line(line) == expected
  end

  test "parses pointer segment" do
    line = "pop pointer 0"
    expected = %Parser.StackCommand{type: :pop, segment: :pointer, index: 0}
    assert Parser.parse_line(line) == expected
  end

  test "parses local segment" do
    line = "pop local 0"
    expected = %Parser.StackCommand{type: :pop, segment: :local, index: 0}
    assert Parser.parse_line(line) == expected
  end

  test "parses argument segment" do
    line = "pop argument 0"
    expected = %Parser.StackCommand{type: :pop, segment: :argument, index: 0}
    assert Parser.parse_line(line) == expected
  end

  test "parses this segment" do
    line = "pop this 0"
    expected = %Parser.StackCommand{type: :pop, segment: :this, index: 0}
    assert Parser.parse_line(line) == expected
  end

  test "parses that segment" do
    line = "pop that 0"
    expected = %Parser.StackCommand{type: :pop, segment: :that, index: 0}
    assert Parser.parse_line(line) == expected
  end
end
