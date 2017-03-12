defmodule HackVm.CodeWriterStackTest do
  use ExUnit.Case
  alias HackVm.CodeWriter
  alias HackVm.Parser

  test "writes push code comment" do
    command = %Parser.StackCommand{type: :push, segment: :constant, index: 0}
    code = CodeWriter.write(command)
    assert code |> String.starts_with?("""

    // push constant 0
    """)
  end

  test "writes push code comment, with different segment and index" do
    command = %Parser.StackCommand{type: :push, segment: :local, index: 10}
    code = CodeWriter.write(command)
    assert code |> String.starts_with?("""

    // push local 10
    """)
  end

  test "writes push code, statement: push this 0" do
    command = %Parser.StackCommand{type: :push, segment: :this, index: 0}
    code = CodeWriter.write(command) |> get_code()
    # assert code == """
    # this is stuff
    # """
  end

  # pop commands

  test "writes pop code comment" do
    command = %Parser.StackCommand{type: :pop, segment: :constant, index: 0}
    code = CodeWriter.write(command)
    assert code |> String.starts_with?("""

    // pop constant 0
    """)
  end

  test "writes pop code comment, with different segment and index" do
    command = %Parser.StackCommand{type: :pop, segment: :local, index: 10}
    code = CodeWriter.write(command)
    assert code |> String.starts_with?("""

    // pop local 10
    """)
  end

  defp get_code(all_code) do
    split_lines = all_code |> String.split("\n")
    [_empty | [_comment | code]] = split_lines
    code ++ [""] |> Enum.join("\n")
  end
end
