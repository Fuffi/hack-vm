defmodule HackVm.ParserTest do
  use ExUnit.Case
  alias HackVm.Parser

  test "parses add command" do
    assert Parser.parse_line("add") == %Parser.Command{type: :add}
  end

  test "parses sub command" do
    assert Parser.parse_line("sub") == %Parser.Command{type: :sub}
  end

  test "parses neg command" do
    assert Parser.parse_line("neg") == %Parser.Command{type: :neg}
  end

  test "parses eq command" do
    assert Parser.parse_line("eq") == %Parser.Command{type: :eq}
  end

  test "parses gt command" do
    assert Parser.parse_line("gt") == %Parser.Command{type: :gt}
  end

  test "parses lt command" do
    assert Parser.parse_line("lt") == %Parser.Command{type: :lt}
  end

  test "parses and command" do
    assert Parser.parse_line("and") == %Parser.Command{type: :and}
  end

  test "parses or command" do
    assert Parser.parse_line("or") == %Parser.Command{type: :or}
  end

  test "parses not command" do
    assert Parser.parse_line("not") == %Parser.Command{type: :not}
  end
end
