defmodule GiocciFaalPubsub do
  GenServer
  @moduledoc """
  Documentation for `GiocciFaalPubsub`.\
  faalサーバーのpubsub機構をシミュレートするモジュールです

  """



  def start_faal_pubsub do
    session = Zenohex.open
    Session.declare_subscriber(session, "from/engine", fn m-> callback(m,session) end)
    # Session.declare_subscriber(session, "return_from/engine", fn m-> callbackrt(m,session) end)

    # {:ok, publisher} = Session.declare_publisher(session, "demo/example/zenoh-rs-pub")
    # Publisher.put(publisher, "Hello zenoh?")
  end

  def publish (session)do
    {:ok, publisher} = Session.declare_publisher(session, "from/faal")
    Publisher.put(publisher, "Hello zenoh?")
  end




  # def return_publish(session)do
  #   {:ok, publisher} = Session.declare_publisher(session, "from/faal")
  #   Publisher.put(publisher, "receive sucessfully")
  # end

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
