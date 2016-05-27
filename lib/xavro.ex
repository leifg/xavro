defmodule Xavro.Schema do
  defstruct type: nil, name: nil, fields: []
end

defmodule Xavro.Schema.Field do
  defstruct name: nil, type: nil, default: nil
end

defmodule Xavro do
  def read_schema(file_name) do
    file_name
      |> :avro.read_schema
      |> Xavro.SchemaLoader.from_erlang
  end
end
