open BsCallback

type stats = <
  dev:         float;
  ino:         float;
  mode:        float;
  nlink:       float;
  uid:         float;
  gid:         float;
  rdev:        float;
  size:        float;
  blksize:     float;
  blocks:      float;
  atimeMs:     float;
  mtimeMs:     float;
  ctimeMs:     float;
  birthtimeMs: float;
  atime:       Js.Date.t;
  mtime:       Js.Date.t;
  ctime:       Js.Date.t;
  birthtime:   Js.Date.t;
> Js.t

type stream_params
external stream_params : ?fd:int -> ?autoClose:bool -> unit -> stream_params = "" [@@bs.obj]

external copyFileSync : string -> string -> unit = "" [@@bs.module "fs"]
external createReadStream  : string Js.nullable -> stream_params -> Stream.readable = "" [@@bs.module "fs"]
external createWriteStream : string Js.nullable -> stream_params -> Stream.writable = "" [@@bs.module "fs"]
external existsSync : string -> bool = "" [@@bs.module "fs"]
external unlinkSync : string -> unit = "" [@@bs.module "fs"]
external rmdirSync : string -> unit = "" [@@bs.module "fs"]
external read : int -> Buffer.t -> float -> float -> float Js.Nullable.t -> (exn Js.Nullable.t -> float -> Buffer.t -> unit) -> unit = "" [@@bs.module "fs"]
external readFile : string -> Buffer.t BsCallback.callback -> unit = "" [@@bs.module "fs"]
external readFileSync : string -> Buffer.t = "" [@@bs.module "fs"]
external write : int -> string -> float Js.Nullable.t -> string Js.Nullable.t -> (exn Js.Nullable.t -> float -> string -> unit) -> unit = "" [@@bs.module "fs"]
external writeFile : string -> string -> unit BsCallback.callback -> unit = "" [@@bs.module "fs"]
(* open is a keywork in OCaml.. *)
external openFile : string -> string -> int BsCallback.callback -> unit = "open" [@@bs.module "fs"]
external close : int -> unit BsCallback.callback -> unit = "" [@@bs.module "fs"]

let read ?position fd buffer offset length cb =
  let position =
    Js.Nullable.fromOption position
  in
  read fd buffer offset length position (fun err read buffer ->
    cb err (read,buffer) [@bs])

let write ?position ?encoding fd data cb =
  let position =
    Js.Nullable.fromOption position
  in
  let encoding =
    Js.Nullable.fromOption encoding
  in
  write fd data position encoding (fun err written str ->
    cb err (written,str) [@bs])

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

external statSync : string -> stats = "" [@@bs.module "fs"]
