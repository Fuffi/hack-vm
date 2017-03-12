defmodule HackVm.Parser do
  defmodule ArithmeticCommand do
    @enfoce_keys [:type]
    defstruct [:type]
  end

  defmodule StackCommand do
    @enfoce_keys [:type, :segment, :index]
    defstruct [:type, :segment, :index]
  end

  def parse_line(line) do
    [command | args] = String.split(line)
    case command do
      # Arithmetic commands
      "add" -> %ArithmeticCommand{type: :add}
      "sub" -> %ArithmeticCommand{type: :sub}
      "neg" -> %ArithmeticCommand{type: :neg}
      "eq" -> %ArithmeticCommand{type: :eq}
      "gt" -> %ArithmeticCommand{type: :gt}
      "lt" -> %ArithmeticCommand{type: :lt}
      "and" -> %ArithmeticCommand{type: :and}
      "or" -> %ArithmeticCommand{type: :or}
      "not" -> %ArithmeticCommand{type: :not}
      # Stack commands
      "push" -> %StackCommand{type: :push, segment: :constant, index: 0}
      "pop" -> %StackCommand{type: :pop, segment: :constant, index: 0}
    end
  end
end
