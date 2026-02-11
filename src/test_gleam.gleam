import gleam/erlang/process
import web.{Context}
import router
import mist
import wisp
import wisp/wisp_mist



pub fn main() {
  wisp.configure_logger()

  let ctx = Context(static_directory: "", items: []) 
  let handler = router.handle_request(_, ctx) 

  let assert Ok(_) =
    wisp_mist.handler(handler, "secret_key")
    |> mist.new
    |> mist.port(8000)
    |> mist.start

  process.sleep_forever()
}