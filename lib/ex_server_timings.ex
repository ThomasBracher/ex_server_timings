defmodule ExServerTimings.Plug do
  require Logger
  alias Plug.Conn
  @behaviour Plug

  def init(_opts) do
    :ok
  end

  def call(conn, :ok) do
    start = System.monotonic_time()

    Conn.register_before_send(conn, fn conn ->
      stop = System.monotonic_time()
      diff = System.convert_time_unit(stop - start, :native, :micro_seconds)

      Conn.put_resp_header(conn, "server-timings", "cpu=#{formatted_diff(diff)}; \"Server Time\"")
    end)
  end

  # Whenever less than 1 ms, display 1 ms
  # The reason is that for now nothing standardise the format,
  # The Chrome implementation unit is the second (TODO: verify minimal value)
  # The official docs indicates unit is millisecond, although not
  defp formatted_diff(diff) when diff <= 1000, do: "0.001"
  defp formatted_diff(diff), do: ((diff |> div(1000)) / 1000) |> Float.to_string()
end
