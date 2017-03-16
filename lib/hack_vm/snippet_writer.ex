defmodule HackVm.SnippetWriter do
  def write_asm_snippet({:comment, text}) do
    """

    // #{text}
    """
  end

  def write_asm_snippet({:push_d}) do
    """
    @SP
    A=M
    M=D

    D=A+1
    @SP
    M=D
    """
  end

  def write_asm_snippet({:pop_d}) do
    """
    @SP
    A=M
    D=A-1

    @SP
    M=D
    A=M
    D=M
    """
  end

  def write_asm_snippet({:add_d_to_stack}) do
    """
    @SP
    A=M-1
    M=M-D
    """
  end

  def write_asm_snippet({:constant_to_d, index}) do
    """
    @#{index}
    D=A
    """
  end

  def write_asm_snippet({:this_to_d, index}) do
    """
    @THIS
    D=M
    @#{index}
    A=D+A
    D=M
    """
  end
end
