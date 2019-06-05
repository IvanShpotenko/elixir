defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search({}, _), do: :not_found
  def search(numbers, key) do
    search(numbers, key, 0, tuple_size(numbers) - 1)
  end

  def search(_numbers, _key, first_i, last_i) when first_i > last_i, do: :not_found
  def search(numbers, key, first_i, last_i) do
    middle = middle_index(first_i, last_i)
    case elem(numbers, middle) do
      ^key -> {:ok, middle}
      n when key < n -> search(numbers, key, first_i, middle - 1)
      n when key > n -> search(numbers, key, middle + 1, last_i)
    end
  end

  def middle_index(first_i, last_i), do: floor((last_i + first_i) / 2)
end
