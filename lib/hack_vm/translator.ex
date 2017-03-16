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

  def translate(%StackCommand{type: :push, segment: :this, index: index}) do
    [
      {:comment, "push this #{index}"},
      {:this_to_d, index},
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
