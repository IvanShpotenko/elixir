defmodule BinarySearchTree do
  @type bst_node :: %{data: any, left: bst_node | nil, right: bst_node | nil}

  defstruct [data: nil, left: nil, right: nil]

  @doc """
  Create a new Binary Search Tree with root's value as the given 'data'
  """
  @spec new(any) :: bst_node
  def new(data) do
    %__MODULE__{data: data}
  end

  @doc """
  Creates and inserts a node with its value as 'data' into the tree.
  """
  @spec insert(bst_node, any) :: bst_node
  def insert(nil, data) do
    new(data)
  end
  def insert(tree=%{data: node_data, left: left}, data) when data <= node_data do
    %{tree | left: insert(left, data)}
  end
  def insert(tree=%{data: node_data, right: right}, data) when data > node_data do
    %{tree | right: insert(right, data)}
  end

  @doc """
  Traverses the Binary Search Tree in order and returns a list of each node's data.
  """
  @spec in_order(bst_node) :: [any]
  def in_order(tree), do: traverse(tree, [])

  defp traverse(nil, list), do: list
  defp traverse(_tree = %{data: data, right: right, left: left}, list) do
    right_list = traverse(right, list)
    traverse(left, [ data | right_list])
  end
end
