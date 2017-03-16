defmodule HackVm.Translator do
  alias HackVm.Parser.StackCommand
  alias HackVm.Parser.ArithmeticCommand

  def translate(%StackCommand{type: :push, segment: :constant, index: index}) do
    [
      {:comment, "push constant #{index}"},
      {:constant_to_d, index},
      {:push_d}
    ]
  end

  def translate(%StackCommand{type: :push, segment: :this, index: index}) do
    [
      {:comment, "push this #{index}"},
      {:this_to_d, index},
      {:push_d}
    ]
  end

  def translate(%ArithmeticCommand{type: :add}) do
    [
      {:comment, "add"},
      {:pop_d},
      {:add_d_to_stack}
    ]
  end

  def translate(%ArithmeticCommand{type: :sub}) do
    [
      {:comment, "sub"},
      {:pop_d},
      {:sub_d_from_stack}
    ]
  end

  def translate(%ArithmeticCommand{type: :eq}) do
    [
      {:comment, "eq"},
      {:pop_d},
      {:eq_d_to_stack}
    ]
  end
end
