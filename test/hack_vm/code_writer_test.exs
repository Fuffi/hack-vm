defmodule HackVm.CodeWriterTest do
  use ExUnit.Case
  alias HackVm.CodeWriter
  alias HackVm.Parser

  test "writes empty line for NoOp command" do
    command = %Parser.NoOp{}
    code = CodeWriter.write(command)
    assert code == ""
  end
end
