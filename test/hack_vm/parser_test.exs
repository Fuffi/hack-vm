defmodule HackVm.ParserTest do
  use ExUnit.Case
  alias HackVm.Parser

  test "parses empty line" do
    assert Parser.parse_line("") == %Parser.NoOp{}
  end

  test "parses comment line" do
    assert Parser.parse_line("//") == %Parser.NoOp{}
  end
end
