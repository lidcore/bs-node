open BsAsyncMonad.Callback

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

type readFile_params = {
  encoding: string [@bs.optional];
  flag: string
} [@@bs.deriving abstract]

external readFile : string -> readFile_params -> Buffer.t callback -> unit = "" [@@bs.module "fs"]
external readFileSync : string -> readFile_params -> Buffer.t = "" [@@bs.module "fs"]
external realpathSync : string -> string = "" [@@bs.module "fs"]
external write : int -> Buffer.t -> float -> float -> float Js.Nullable.t -> (exn Js.Nullable.t -> float -> Buffer.t -> unit) -> unit = "" [@@bs.module "fs"]
external writeFile : string -> string -> unit callback -> unit = "" [@@bs.module "fs"]
external writeFileSync : string -> string -> unit = "" [@@bs.module "fs"]
(* open is a keywork in OCaml.. *)
external openFile : string -> string -> int callback -> unit = "open" [@@bs.module "fs"]
external close : int -> unit callback -> unit = "" [@@bs.module "fs"]

let read ?position ?(offset=0.) ?length fd buffer cb =
  let position =
    Js.Nullable.fromOption position
  in
  let length =
    match length with
      | Some len -> len
      | None -> Buffer.length buffer -. offset
  in
  read fd buffer offset length position (fun err read buffer ->
    cb err (read,buffer) [@bs])

let write ?position ?(offset=0.) ?length fd buffer cb =
  let position =
    Js.Nullable.fromOption position
  in
  let length =
    match length with
      | Some len -> len
      | None -> Buffer.length buffer -. offset
  in
  write fd buffer offset length position (fun err written str ->
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
  readFile path (readFile_params ~flag:"r" ())
let readFileSync path =
  readFileSync path (readFile_params ~flag:"r" ())

external statSync : string -> stats = "" [@@bs.module "fs"]
