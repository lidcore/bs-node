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
val openFile : string -> string -> int BsCallback.t
val close : int -> unit BsCallback.t
val unlinkSync : string -> unit 
val read : int -> Buffer.t -> int -> int -> int -> (int*Buffer.t) BsCallback.t
val readFile : string -> string BsCallback.t
val readFileSync : string -> string
val writeFile : string -> string -> unit BsCallback.t
val rmdirSync : string -> unit
val statSync : string -> stats
