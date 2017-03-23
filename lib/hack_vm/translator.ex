defmodule HackVm.Translator do
  alias HackVm.Parser.StackCommand
  alias HackVm.Parser.ArithmeticCommand
  alias HackVm.Parser.NoOp

  def translate(%NoOp{}) do
    []
  end

  def translate(%StackCommand{type: :push, segment: :constant, index: index}) do
    [
      {:comment, "push constant #{index}"},
      {:constant_to_d, index},
      {:push_d}
    ]
  end

  def translate(%StackCommand{type: :push, segment: :local, index: index}) do
    [
      {:comment, "push local #{index}"},
      {:pointed_segment_to_d, "LCL", index},
      {:push_d}
    ]
  end

  def translate(%StackCommand{type: :push, segment: :argument, index: index}) do
    [
      {:comment, "push argument #{index}"},
      {:pointed_segment_to_d, "ARG", index},
      {:push_d}
    ]
  end

  def translate(%StackCommand{type: :push, segment: :this, index: index}) do
    [
      {:comment, "push this #{index}"},
      {:pointed_segment_to_d, "THIS", index},
      {:push_d}
    ]
  end

  def translate(%StackCommand{type: :push, segment: :that, index: index}) do
    [
      {:comment, "push that #{index}"},
      {:pointed_segment_to_d, "THAT", index},
      {:push_d}
    ]
  end

  def translate(%StackCommand{type: :push, segment: :temp, index: index}) do
    [
      {:comment, "push temp #{index}"},
      {:direct_segment_to_d, "5", index},
      {:push_d}
    ]
  end

  def translate(%StackCommand{type: :push, segment: :static, index: index}) do
    [
      {:comment, "push static #{index}"},
      {:direct_segment_to_d, "16", index},
      {:push_d}
    ]
  end

  def translate(%ArithmeticCommand{type: :neg}) do
    [
      {:comment, "neg"},
      {:unary_stack_operation, "-"}
    ]
  end

  def translate(%ArithmeticCommand{type: :not}) do
    [
      {:comment, "not"},
      {:unary_stack_operation, "!"}
    ]
  end

  def translate(%ArithmeticCommand{type: :add}) do
    [
      {:comment, "add"},
      {:pop_d},
      {:binary_stack_operation, "+"}
    ]
  end

  def translate(%ArithmeticCommand{type: :sub}) do
    [
      {:comment, "sub"},
      {:pop_d},
      {:binary_stack_operation, "-"}
    ]
  end

  def translate(%ArithmeticCommand{type: :and}) do
    [
      {:comment, "sub"},
      {:pop_d},
      {:binary_stack_operation, "&"}
    ]
  end

  def translate(%ArithmeticCommand{type: :or}) do
    [
      {:comment, "sub"},
      {:pop_d},
      {:binary_stack_operation, "|"}
    ]
  end

  def translate(%ArithmeticCommand{type: :eq}) do
    [
      {:comment, "eq"},
      {:pop_d},
      {:compare_d_to_stack, "JEQ"}
    ]
  end

  def translate(%ArithmeticCommand{type: :lt}) do
    [
      {:comment, "lt"},
      {:pop_d},
      {:compare_d_to_stack, "JLT"}
    ]
  end

  def translate(%ArithmeticCommand{type: :gt}) do
    [
      {:comment, "gt"},
      {:pop_d},
      {:compare_d_to_stack, "JGT"}
    ]
  end
end
