defmodule HackVm.CodeWriter do
  alias HackVm.Parser.ArithmeticCommand
  alias HackVm.Parser.StackCommand

  def write(%ArithmeticCommand{type: :add}) do
    """

    // add
    """
  end

  def write(%StackCommand{type: :push, segment: segment, index: index}) do
    """

    // push #{segment} #{index}
    """
  end

  def write(%StackCommand{type: :pop, segment: segment, index: index}) do
    """

    // pop #{segment} #{index}
    """
  end
end
