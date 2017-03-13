defmodule HackVm.SnippetWriter do
  defp write_asm_snippet({:comment, text}) do
    """

    // #{text}
    """
  end

  defp write_asm_snippet({:constant_to_d, index}) do
    """
    @#{index}
    D=A
    """
  end

  defp write_asm_snippet({:this_to_d, index}) do
    """
    @THIS
    D=M
    @#{index}
    A=D+A
    D=M
    """
  end

  defp write_asm_snippet({:push_d_to_stack}) do
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
