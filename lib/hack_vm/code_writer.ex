defmodule HackVm.CodeWriter do
  def write(%HackVm.Parser.ArithmeticCommand{type: :add} = _command) do
    """

    // add
    """
  end
end
