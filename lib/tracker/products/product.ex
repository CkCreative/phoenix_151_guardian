defmodule Tracker.Products.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :sku, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:title, :sku])
    |> validate_required([:title, :sku])
  end
end
