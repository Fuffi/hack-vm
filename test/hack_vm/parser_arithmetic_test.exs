defmodule HackVm.ParserArithmeticTest do
  use ExUnit.Case
  alias HackVm.Parser

  test "parses add command" do
    assert Parser.parse_line("add") == %Parser.ArithmeticCommand{type: :add}
  end

  test "parses sub command" do
    assert Parser.parse_line("sub") == %Parser.ArithmeticCommand{type: :sub}
  end

  test "parses neg command" do
    assert Parser.parse_line("neg") == %Parser.ArithmeticCommand{type: :neg}
  end

  test "parses eq command" do
    assert Parser.parse_line("eq") == %Parser.ArithmeticCommand{type: :eq}
  end

  test "parses gt command" do
    assert Parser.parse_line("gt") == %Parser.ArithmeticCommand{type: :gt}
  end

  test "parses lt command" do
    assert Parser.parse_line("lt") == %Parser.ArithmeticCommand{type: :lt}
  end

  test "parses and command" do
    assert Parser.parse_line("and") == %Parser.ArithmeticCommand{type: :and}
  end

  test "parses or command" do
    assert Parser.parse_line("or") == %Parser.ArithmeticCommand{type: :or}
  end

  test "parses not command" do
    assert Parser.parse_line("not") == %Parser.ArithmeticCommand{type: :not}
  end
end
