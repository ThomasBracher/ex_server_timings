defmodule ExServerTimingsTest do
  use ExUnit.Case, async: true
  use Plug.Test

  defmodule MyPlug do
    use Plug.Builder

    plug ExServerTimings.Plug
    plug :passthrough

    defp passthrough(conn, _) do
      # make sure the response is not in micro seconds
      :timer.sleep(20)
      Plug.Conn.send_resp(conn, 200, "Passthrough")
    end
  end

  test "logs proper message to console" do
    timing_header = conn(:get, "/")
    |> MyPlug.call([])
    |> Plug.Conn.get_resp_header("server-timing")
    |> hd

    assert Regex.match?(~r/cpu;dur=[1-9][0-9]*;desc="Server Time"/, timing_header)
  end
end
