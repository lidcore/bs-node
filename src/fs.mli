open BsAsyncMonad

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

val copyFileSync : string -> string -> unit
val createWriteStream : ?path:string -> ?fd:int -> ?autoClose:bool -> unit -> Stream.writable
val createReadStream : ?path:string -> ?fd:int -> ?autoClose:bool -> unit -> Stream.readable
val existsSync : string -> bool
val openFile : string -> string -> int Callback.t
val close : int -> unit Callback.t
val unlinkSync : string -> unit 
val read : ?position:float -> ?offset:float -> ?length:float -> int -> Buffer.t -> (float*Buffer.t) Callback.t
val readFile : string -> Buffer.t Callback.t
val readFileSync : string -> Buffer.t
val write : ?position:float -> ?offset:float -> ?length:float -> int -> Buffer.t -> (float*Buffer.t) Callback.t
val writeFile : string -> string -> unit Callback.t
val rmdirSync : string -> unit
val statSync : string -> stats
