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

    D=0
    @WRITE_#{line_number}
    0;JMP

    (COMPARE_IS_TRUE_#{line_number})
    D=-1

    (WRITE_#{line_number})
    @SP
    A=M-1
    M=D
    """
  end

  def write_asm_snippet({:pointed_segment_to_d, segment, index}, _) do
    """
    @#{segment}
    D=M
    @#{index}
    A=D+A
    D=M
    """
  end

  def write_asm_snippet({:direct_segment_to_d, segment, index}, _) do
    """
    @#{segment}
    D=A
    @#{index}
    A=D+A
    D=M
    """
  end

  def write_asm_snippet({:constant_to_d, index}, _) do
    """
    @#{index}
    D=A
    """
  end

  def write_asm_snippet({:d_to_pointed_segment, segment, index}, _) do
    """
    @R13
    M=D
    @#{segment}
    D=M
    @#{index}
    D=D+A
    @R14
    M=D
    @R13
    D=M
    @R14
    A=M
    M=D
    """
  end

  def write_asm_snippet({:d_to_direct_segment, segment, index}, _) do
    """
    @R13
    M=D
    @#{segment}
    D=A
    @#{index}
    D=D+A
    @R14
    M=D
    @R13
    D=M
    @R14
    A=M
    M=D
    """
  end
end
