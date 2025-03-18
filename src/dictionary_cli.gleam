import argv
import gleam/http/request
import gleam/httpc
import gleam/io
import gleam/result
import gleam/uri

// TODO: import API keys from .env file
pub const mw_dictionary_key: String = ""
pub const mw_thesaurus_key: String = ""

// base request url's
pub const dictionary_url: String = "https://www.dictionaryapi.com/api/v3/references/collegiate/json/"
pub const thesaurus_url: String = "https://www.dictionaryapi.com/api/v3/references/thesaurus/json/"

pub fn main() -> Nil {
  argv.load().arguments
  |> parse_args
  |> io.println

	// let word = "..."
	// let api_call = dictionary_url <> word <> "?key=" <> mw_dictionary_key

  call_api(mw_dictionary_key)
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
        _ -> ""
      }
    }
    _ -> ""
  }
}
