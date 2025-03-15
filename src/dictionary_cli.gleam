import argv
import gleam/http/request
import gleam/httpc
import gleam/io
import gleam/result
import gleam/uri

// returns a random joke
pub const jokes_api: String = "https://official-joke-api.appspot.com/random_joke"

// returns 10 random jokes
// let ten_jokes_api: String = "https://official-joke-api.appspot.com/random_ten"

pub fn main() -> Nil {
  argv.load().arguments
  |> parse_args
  |> io.println

  call_api(jokes_api)
  |> result.unwrap("Error: couldn't get HTTP response")
  |> io.println
}

pub fn call_api(api: String) -> Result(String, Nil) {
  use api_uri <- result.try(uri.parse(api))
  use req <- result.try(request.from_uri(api_uri))

  case httpc.send(req) {
    Ok(resp) -> Ok(resp.body)
    Error(_err) -> Error(Nil)
  }
}

pub fn parse_args(args: List(String)) -> String {
  case args {
    ["-h"] | ["--help"] -> "help message ..."
    [word] -> "word = " <> word
    [word, ..rest] -> {
      case rest {
        ["--pos=" <> pos] | ["--pos", pos] ->
          "word = " <> word <> "\npos = " <> pos
        _ -> "something else"
      }
    }
    _ -> ""
  }
}
