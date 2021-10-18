defmodule Exmeal.Users.Create do
  alias Exmeal.{Error, Repo, User}

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %User{}} = response), do: response

  defp handle_insert({:error, reason}), do: {:error, Error.build(:bad_request, reason)}
end
