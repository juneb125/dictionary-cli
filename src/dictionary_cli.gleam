import gleam/http/request
import gleam/httpc
import gleam/io
import gleam/result.{try}
import gleam/uri.{parse}

pub fn main() -> Nil {
  io.println("Hello, world!")

  // returns a random joke
  let joke_api: String = "https://official-joke-api.appspot.com/random_joke"
  // returns 10 random jokes
  // let ten_jokes_api: String = "https://official-joke-api.appspot.com/random_ten"

  call_api(joke_api)
  |> result.unwrap("Error: couldn't get HTTP response")
  |> io.println
}

pub fn call_api(api: String) -> Result(String, Nil) {
  // parse :: String -> Result(uri.Uri, Nil)
  use uri <- try(parse(api))

  // from_uri :: uri.Uri -> Result(Request(String), Nil)
  use req <- try(request.from_uri(uri))

  // send :: Request(String) -> Result(Response(String), httpc.HttpError)
  case httpc.send(req) {
    Ok(resp) -> Ok(resp.body)
    Error(_err) -> Error(Nil)
  }
}
