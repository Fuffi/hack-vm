defmodule HackVm.CodeWriterTest do
  use ExUnit.Case
  alias HackVm.CodeWriter
  alias HackVm.Parser

  test "writes push code comment" do
    command = %Parser.NoOp{}
    code = CodeWriter.write(command)
    assert code == ""
  end
end
