# ExServerTimings
[![Build Status](https://travis-ci.org/ThomasBracher/ex_server_timings.svg?branch=master)](https://travis-ci.org/ThomasBracher/ex_server_timings)

This package is a plug to put the http header [Server Timings](https://w3c.github.io/server-timing/)
which allow to visualise the server performances in your browser. For more information, refer to
[this blog](https://ma.ttias.be/server-timings-chrome-devtools/) and this
[tweet](https://twitter.com/paul_irish/status/829090506084749312) from Google Chrome devtools.

## Installation

The package is [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `ex_server_timings` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:ex_server_timings, "~> 0.1.0"}]
end
```

## Usage

In your `lib/endpoint.ex` or in your `web/router.ex`, add the following line:

```elixir
plug ExServerTimings.Plug
```

## Docs

The docs can be found at [https://hexdocs.pm/ex_server_timings](https://hexdocs.pm/ex_server_timings).
But i suggest you read the source code, it should be more updated and clearer.

## Todo

[Specifications](https://w3c.github.io/server-timing/#cross-origin-resources) indicate that in case
of CORS requests timings should pass `Timing-Allow-Origin` to allow the user to see timings.

Right now, this are not yet implemented because of the early stage of the standard and low support by
browsers.

Also, nothing specifies the unit of metrics passed. Right now we stick to Chrome implementation, but
we should be careful of any changes.

## License
The MIT License (MIT)

Copyright (c) 2017 Thomas Bracher

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
