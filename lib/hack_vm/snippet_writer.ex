defmodule HackVm.SnippetWriter do
  def write_asm_snippet({:comment, text}, line_number) do
    """

    // #{line_number}: #{text}
    """
  end

  def write_asm_snippet({:push_d}, _) do
    """
    @SP
    A=M
    M=D

    D=A+1
    @SP
    M=D
    """
  end

  def write_asm_snippet({:pop_d}, _) do
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

  def write_asm_snippet({:unary_stack_operation, unary_operator}, _) do
    """
    @SP
    A=M-1
    M=#{unary_operator}M
    """
  end

  def write_asm_snippet({:binary_stack_operation, binary_operator}, _) do
    """
    @SP
    A=M-1
    M=M#{binary_operator}D
    """
  end

  def write_asm_snippet({:compare_d_to_stack, jump_operator}, line_number) do
    """
    @SP
    A=M-1

    D=M-D
    @COMPARE_IS_TRUE_#{line_number}
    D;#{jump_operator}

    D=-1
    @WRITE
    0;JMP

    (COMPARE_IS_TRUE_#{line_number})
    D=0

    (WRITE)
    @SP
    A=M-1
    M=D
    """
  end

  def write_asm_snippet({:constant_to_d, index}, _) do
    """
    @#{index}
    D=A
    """
  end

  def write_asm_snippet({:this_to_d, index}, _) do
    """
    @THIS
    D=M
    @#{index}
    A=D+A
    D=M
    """
  end
end
