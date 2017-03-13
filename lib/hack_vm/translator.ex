defmodule HackVm.Translator do
  alias HackVm.Parser.StackCommand

  def translate(%StackCommand{type: :push, segment: :constant, index: index}) do
    [
      {:comment, "push constant #{index}"},
      {:constant_to_d, index},
      {:push_d_to_stack}
    ]
  end

  def translate(%StackCommand{type: :push, segment: :this, index: index}) do
    [
      {:comment, "push this #{index}"},
      {:this_to_d, index},
      {:push_d_to_stack}
    ]
  end
end
