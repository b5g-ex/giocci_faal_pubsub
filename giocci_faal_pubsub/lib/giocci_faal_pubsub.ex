defmodule GiocciFaalPubsub do
  GenServer
  @moduledoc """
  Documentation for `GiocciFaalPubsub`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> GiocciFaalPubsub.hello()
      :world

  """

  def start_faal_pubsub do
    session = Zenohex.open
    Session.declare_subscriber(session, "to/faal", fn m-> callback(m,session) end)
    # Session.declare_subscriber(session, "return_from/engine", fn m-> callbackrt(m,session) end)

    # {:ok, publisher} = Session.declare_publisher(session, "demo/example/zenoh-rs-pub")
    # Publisher.put(publisher, "Hello zenoh?")
  end

  def publish (session)do
    {:ok, publisher} = Session.declare_publisher(session, "to/engine")
    Publisher.put(publisher, "Hello zenoh?")
  end



  # def subscribe do
  #   session = Zenohex.open
  #   Session.declare_subscriber(session, "to/faal", fn m-> callback(m,session) end)

  # end

  def return_publish(session)do
    {:ok, publisher} = Session.declare_publisher(session, "to/engine")
    Publisher.put(publisher, "receive sucessfully")
  end

  defp callback(m,session) do
    msg = m |> String.trim
            |> Base.decode64!
            |> String.trim
            |> :erlang.binary_to_term
    IO.inspect(msg)
  end

  # defp callbackrt(m,session) do
  #   IO.puts(m)
  #   # return_publish(session)
  # end


  # defp callback(m,session) do
  #   IO.puts(m)
  #   return_publish(session)
  # end

end
