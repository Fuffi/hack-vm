defmodule HackVm.CodeWriterArithmeticTest do
  use ExUnit.Case
  alias HackVm.CodeWriter
  alias HackVm.Parser

  test "writes add code comment" do
    command = %Parser.ArithmeticCommand{type: :add}
    code = CodeWriter.write(command)
    assert code |> String.starts_with?("""

    // add
    """)
  end
end
