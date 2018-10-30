open BsAsyncMonad

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

type flag = [
  | `COPYFILE_EXCL
  | `COPYFILE_FICLONE
  | `COPYFILE_FICLONE_FORCE
]

type access = [
  | `F_OK
  | `R_OK
  | `W_OK
  | `X_OK
]

val access : ?mode:access list -> string -> unit Callback.t
val copyFileSync : ?flags:flag list -> string -> string -> unit
val createWriteStream : ?path:string -> ?fd:int -> ?autoClose:bool -> unit -> Stream.writable
val createReadStream : ?path:string -> ?fd:int -> ?autoClose:bool -> unit -> Stream.readable
val existsSync : string -> bool
val openFile : string -> string -> int Callback.t
val close : int -> unit Callback.t
val unlinkSync : string -> unit 
val read : ?position:float -> ?offset:float -> ?length:float -> int -> Buffer.t -> (float*Buffer.t) Callback.t
val readFile : string -> Buffer.t Callback.t
val readFileSync : string -> Buffer.t
val realpathSync : string -> string
val write : ?position:float -> ?offset:float -> ?length:float -> int -> Buffer.t -> (float*Buffer.t) Callback.t
val writeFile : string -> string -> unit Callback.t
val writeFileSync : string -> string -> unit
val rmdirSync : string -> unit
val statSync : string -> stats
val isDirectory : stats -> bool
