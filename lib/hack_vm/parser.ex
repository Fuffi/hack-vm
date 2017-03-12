defmodule HackVm.Parser do
  defmodule Command do
    @enfoce_keys [:type]
    defstruct [:type, :segment, :index]
  end

  def parse_line(line) do
    case line do
      "add" -> %Command{type: :add}
      "sub" -> %Command{type: :sub}
      "neg" -> %Command{type: :neg}
      "eq" -> %Command{type: :eq}
      "gt" -> %Command{type: :gt}
      "lt" -> %Command{type: :lt}
      "and" -> %Command{type: :and}
      "or" -> %Command{type: :or}
      "not" -> %Command{type: :not}
    end
  end
end
