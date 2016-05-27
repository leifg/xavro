defmodule Xavro.SchemaLoader do
  @types %{
    'string' => :string,
    'int' => :int,
    'float' => :float
  }

  def from_erlang(input) do
    parse(input)
  end

  defp parse({:ok, {:avro_record_type, name, _first, _second, _third, fields, _}}) do
    %Xavro.Schema{
      type: :record,
      name: to_string(name),
      fields: Enum.map(fields, &parse_field/1)
    }
  end

  # {:avro_record_field, 'name', [], {:avro_primitive_type, 'string'}, :undefined, :ascending, []}

  defp parse_field({:avro_record_field, name, _opts, {:avro_primitive_type, type}, _, _, _}) do
    %Xavro.Schema.Field{
      name: to_string(name),
      type: @types[type]
    }
  end
end
