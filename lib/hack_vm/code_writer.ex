defmodule HackVm.CodeWriter do
  alias HackVm.Parser.NoOp
  alias HackVm.Parser.ArithmeticCommand
  alias HackVm.Parser.StackCommand

  def write(%NoOp{}) do
    ""
  end

  def write(%ArithmeticCommand{type: :add}) do
    """

    // add
    """
  end

  def write(%StackCommand{type: :push, segment: segment, index: index}) do
    write_comment(:push, segment, index)
    <>
    write_push(segment, index)
  end

  def write(%StackCommand{type: :pop, segment: segment, index: index}) do
    write_comment(:pop, segment, index)
  end

  defp write_comment(command_type, segment, index) do
    """

    // #{command_type} #{segment} #{index}
    """
  end

  defp write_push(:constant, index) do
    """
    @#{index}
    D=A
    """ <> push_d_to_stack()
  end

  defp write_push(:this, index) do
    """
    @THIS
    D=M
    @#{index}
    A=D+A
    D=M
    """ <> push_d_to_stack()
  end

  defp write_push(_, _) do
    ""
  end

  defp push_d_to_stack() do
    """
    @SP
    A=M
    M=D

    D=A+1
    @SP
    M=D
    """
  end
end
