open BsCallback

type stream_params
external stream_params : ?fd:int -> ?autoClose:bool -> unit -> stream_params = "" [@@bs.obj]

external copyFileSync : string -> string -> unit = "" [@@bs.module "fs"]
external createReadStream  : string Js.nullable -> stream_params -> Stream.readable = "" [@@bs.module "fs"]
external createWriteStream : string Js.nullable -> stream_params -> Stream.writable = "" [@@bs.module "fs"]
external existsSync : string -> bool = "" [@@bs.module "fs"]
external unlinkSync : string -> unit = "" [@@bs.module "fs"]
external rmdirSync : string -> unit = "" [@@bs.module "fs"]
external read : int -> Buffer.t -> int -> int -> int -> (exn Js.Nullable.t -> int -> Buffer.t -> unit) -> unit = "" [@@bs.module "fs"]
external readFile : string -> Buffer.t BsCallback.callback -> unit = "" [@@bs.module "fs"]
external readFileSync : string -> Buffer.t = "" [@@bs.module "fs"]
external writeFile : string -> string -> unit BsCallback.callback -> unit = "" [@@bs.module "fs"]
(* open is a keywork in OCaml.. *)
external openFile : string -> string -> int BsCallback.callback -> unit = "open" [@@bs.module "fs"]
external close : int -> unit BsCallback.callback -> unit = "" [@@bs.module "fs"]

let read fd buffer offset length position cb =
  read fd buffer offset length position (fun err read buffer ->
    cb err (read,buffer) [@bs])

let createStream fn ?path ?fd ?autoClose () =
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
let readFile path =
  readFile path >> fun data ->
    BsCallback.return (Buffer.toString data)
let readFileSync path =
  Buffer.toString (readFileSync path)
