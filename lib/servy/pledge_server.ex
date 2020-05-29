defmodule Servy.PledgeServer do
  def listen_loop(state) do
    IO.puts("\nWaiting for a message...")

    receive do
      {:create_pledge, name, amount} ->
        {:ok, _id} = send_pledge_to_service(name, amount)
        new_state = [{name, amount} | state]
        IO.puts("#{name} pledge #{amount}!")
        IO.puts("New state is #{inspect(new_state)}")
        listen_loop(new_state)

      {sender, :recent_pledges} ->
        send(sender, {:response, state})
        IO.puts("Sent pledges to #{inspect(sender)}")
        listen_loop(state)
    end
  end

  # def create_pledge(name, amount) do
  #   {:ok, id} = send_pledge_to_service(name, amount)

  #   # Cache the pledge:
  #   [{"larry", 10}]
  # end

  # def recent_pledges() do
  #   # Returns the most recent pledges (cache):
  #   [{"larry", 10}]
  # end

  defp send_pledge_to_service(_name, _amount) do
    # Code goes here to send pledge to external service

    {:ok, "pledge-#{:rand.uniform(1_000)}"}
  end
end
