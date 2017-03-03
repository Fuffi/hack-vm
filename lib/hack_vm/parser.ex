defmodule HackVm.Parser do
  defmodule ArithmeticCommand do
    @enforce_keys [:type]
    defstruct [:type]
  end

  defmodule StackCommand do
    @enforce_keys [:type, :segment, :index]
    defstruct [:type, :segment, :index]
  end

  defmodule NoOp do
    defstruct []
  end

  def parse_line(line) do
    [command | args] = (line || "//") |> String.split()
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
      "push" ->
        [segment , index] = args
        %StackCommand{
          type: :push,
          segment: parse_segment(segment),
          index: parse_index(index)
        }
      "pop" ->
        [segment , index] = args
        %StackCommand{
          type: :pop,
          segment: parse_segment(segment),
          index: parse_index(index)
        }
      "//" -> %NoOp{}
    end
  end

  defp parse_segment(value) do
    case value do
      "static" -> :static
      "constant" -> :constant
      "temp" -> :temp
      "pointer" -> :pointer
      "local" -> :local
      "argument" -> :argument
      "this" -> :this
      "that" -> :that
    end
  end

  defp parse_index(value) do
    {result, _remainder} = Integer.parse(value)
    result
  end
end
