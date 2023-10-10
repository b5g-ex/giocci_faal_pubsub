defmodule GiocciFaalPubsub do
  @moduledoc """
  Documentation for `GiocciFaalPubsub`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> GiocciFaalPubsub.hello()
      :world

  """
  def hello do
    :world
  end

  def start_faal_pubsub do
    NifZenoh.tester_sub ("demo/example/zenoh-rs-pub")
    # session = Zenohex.open
    # {:ok, publisher} = Session.declare_publisher(session, "demo/example/zenoh-rs-pub")
    # Publisher.put(publisher, "Hello zenoh?")
  end
  def publish (session)do
    {:ok, publisher} = Session.declare_publisher(session, "demo/example/zenoh-rs-pub")
    Publisher.put(publisher, "Hello zenoh?")
  end
  def subscribe do
    session = Zenohex.open
    Session.declare_subscriber(session, "demo/example/zenoh-rs-pub", fn m -> IO.inspect(m) end)
  end
end
