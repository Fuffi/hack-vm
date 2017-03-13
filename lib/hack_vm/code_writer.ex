defmodule HackVm.CodeWriter do
  alias HackVm.Parser.NoOp
  alias HackVm.Parser.ArithmeticCommand
  alias HackVm.Parser.StackCommand
  alias HackVm.Translator

  def write(%NoOp{}) do
    ""
  end

  def write(command) do
    pseudo_snippets = Translator.translate(command)
    asm_snippets = pseudo_snippets |> Enum.map(fn(pseudo_snippet) ->
      write_asm_snippet(pseudo_snippet)
    end)

    asm_snippets |> Enum.join("\n")
  end
end
