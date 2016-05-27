defmodule XavroTest do
  use ExUnit.Case
  doctest Xavro

  test "read_schema" do
    schema = Xavro.read_schema("#{__DIR__}/resources/schemas/drink.avsc")
    expected = %Xavro.Schema{
      name: "drink",
      type: :record,
      fields: [
        %Xavro.Schema.Field{name: "name", type: :string, default: nil},
        %Xavro.Schema.Field{name: "alcohol", type: :float, default: nil},
        %Xavro.Schema.Field{name: "price", type: :float, default: nil},
        %Xavro.Schema.Field{name: "size", type: :int, default: nil},
      ]
    }
    assert schema == expected
  end
end
