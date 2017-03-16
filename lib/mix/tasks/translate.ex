defmodule Mix.Tasks.HackVm.Translate do
  use Mix.Task

  @shortdoc "Translates [input] vm code into [output] hack asm code"

  def run([input, output]) do
    HackVm.main([input, output])
  end
end
