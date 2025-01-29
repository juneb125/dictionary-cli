import gleam/io
import gleam/http/request
import gleam/httpc
import gleam/result.{try}
import gleam/uri.{parse}

// import gleam/http/response

pub fn main() {
  io.println("Hello, world!")

	// returns a random joke
	let joke_api = "https://official-joke-api.appspot.com/random_joke"
	// returns 10 random jokes
	// let ten_jokes_api = "https://official-joke-api.appspot.com/random_ten"
  api_stuff(joke_api)
}

pub fn api_stuff(api: String) -> Result(String, Nil) {
	// parse :: String -> Result(Uri, Nil)
	use uri <- try(parse(api))

	// from_uri :: Uri -> Result(Request(String), Nil)
	use req <- try(request.from_uri(uri))

	// send :: Request(String) -> Result(Response(String), HttpError)
	case httpc.send(req) {
		Ok(r) -> Ok(r.body)
		Error(e) -> {
			io.debug(e)
			Error(Nil)
		}
	}
}
