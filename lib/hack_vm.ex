defmodule HackVm do
  alias HackVm.Parser
  alias HackVm.CodeWriter
  
  def main(args \\ []) do
    # {opts, _, _} = OptionParser.parse(args,
    #   switches: [start: :integer, end: :integer, src: :string, dest: :string, update_tags: :string],
    #   aliases: [s: :start, e: :end, S: :src, d: :dest, u: :update_tags]
    #   )

    [input_path, output_path] = args
    IO.puts "Not implemented yet: #{input_path} #{output_path}"

    {:ok, body} = File.read(input_path)

    input_lines = body |> String.split("\n")
    output_lines = input_lines |> Enum.map(fn(line) ->
      line |> Parser.parse_line() |> CodeWriter.write()
    end)

    :ok = File.write(output_path, body)
  end
end
