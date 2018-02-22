open Callback

type stream_params
external stream_params : ?fd:int -> ?autoClose:Js.boolean -> unit -> stream_params = "" [@@bs.obj]

external copyFileSync : string -> string -> unit = "" [@@bs.module "fs"]
external createReadStream  : string Js.nullable -> stream_params -> Node_stream.readable = "" [@@bs.module "fs"]
external createWriteStream : string Js.nullable -> stream_params -> Node_stream.writable = "" [@@bs.module "fs"]
external existsSync : string -> Js.boolean = "" [@@bs.module "fs"]
external unlinkSync : string -> unit = "" [@@bs.module "fs"]
external read : int -> Node_buffer.t -> int -> int -> int -> (exn Js.Nullable.t -> int -> Node_buffer.t -> unit) -> unit = "" [@@bs.module "fs"]
external readFile : string -> Node_buffer.t Callback.callback -> unit = "" [@@bs.module "fs"]
external readFileSync : string -> Node_buffer.t = "" [@@bs.module "fs"]
external writeFile : string -> string -> unit Callback.callback -> unit = "" [@@bs.module "fs"]
(* open is a keywork in OCaml.. *)
external openFile : string -> string -> int Callback.callback -> unit = "open" [@@bs.module "fs"]
external close : int -> unit Callback.callback -> unit = "" [@@bs.module "fs"]

let read fd buffer offset length position cb =
  read fd buffer offset length position (fun err read buffer ->
    cb err (read,buffer) [@bs])

let createStream fn ?path ?fd ?autoClose () =
  let autoClose =
    match autoClose with
      | Some b -> Some (Js.Boolean.to_js_boolean b)
      | None -> None
  in
  let params =
    stream_params ?fd ?autoClose ()
  in
  let default = function
    | None -> Js.Nullable.null
    | Some v -> Js.Nullable.return v
  in
  let path = default path in
  fn path params

let createReadStream = createStream createReadStream
let createWriteStream = createStream createWriteStream
let existsSync path = Js.to_bool (existsSync path)
let readFile path =
  readFile path >> fun data ->
    Callback.return (Node_buffer.toString data)
let readFileSync path =
  Node_buffer.toString (readFileSync path)
