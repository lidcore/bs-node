open BsAsyncMonad.Callback

type stats = private {
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
} [@@bs.deriving abstract]

external copyfile_excl : int = "COPYFILE_EXCL" [@@bs.val]  [@@bs.scope "fs.constants"]
external copyfile_ficlone : int = "COPYFILE_FICLONE" [@@bs.val]  [@@bs.scope "fs.constants"]
external copyfile_ficlone_force : int = "COPYFILE_FICLONE_FORCE" [@@bs.val]  [@@bs.scope "fs.constants"]

type flag = [
  | `COPYFILE_EXCL
  | `COPYFILE_FICLONE
  | `COPYFILE_FICLONE_FORCE
]

let int_of_flag = function
  | `COPYFILE_EXCL -> copyfile_excl
  | `COPYFILE_FICLONE -> copyfile_ficlone
  | `COPYFILE_FICLONE_FORCE -> copyfile_ficlone_force

type stream_params
external stream_params : ?fd:int -> ?autoClose:bool -> unit -> stream_params = "" [@@bs.obj]

external copyFileSync : string -> string -> int -> unit = "" [@@bs.module "fs"]

let copyFileSync ?(flags=[]) src dst =
  let flag = List.fold_left (fun x y ->
    x lor int_of_flag y) 0 flags
  in
  copyFileSync src dst flag

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

external isDirectory : stats -> bool = "" [@@bs.send]
external statSync : string -> stats = "" [@@bs.module "fs"]
