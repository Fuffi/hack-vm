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

  def write_asm_snippet({:unary_stack_operation, unary_operator}) do
    """
    @SP
    A=M-1
    M=#{unary_operator}M
    """
  end

  def write_asm_snippet({:binary_stack_operation, binary_operator}) do
    """
    @SP
    A=M-1
    M=M#{binary_operator}D
    """
  end

  def write_asm_snippet({:compare_d_to_stack, jump_operator}) do
    """
    @SP
    A=M-1

    D=M-D
    @COMPARE_IS_TRUE
    D;#{jump_operator}

    D=-1
    @WRITE
    0;JMP

    (COMPARE_IS_TRUE)
    D=0

    (WRITE)
    @SP
    A=M-1
    M=D
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
