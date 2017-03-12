defmodule HackVm.CodeWriterArithmeticTest do
  use ExUnit.Case
  alias HackVm.CodeWriter
  alias HackVm.Parser

  test "writes add code" do
    command = %Parser.ArithmeticCommand{type: :add}
    assert CodeWriter.write(command) == """
    
    // add
    """
  end
end
