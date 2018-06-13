open BsAsyncMonad

val exec : string -> (string*string) Callback.t
val execSync : string -> string
val execFile : ?cwd:string -> ?env:string Js.Dict.t -> ?encoding:string -> ?timeout:int -> ?maxBuffer:float -> ?killSignal:string -> ?uid:int -> ?gid:int -> ?windowsHide:bool -> ?windowsVerbatimOptions:bool -> ?shell:string -> string -> string array -> (string*string) Callback.t

type spawned_io = <
  stdin  : Stream.writable;
  stdout : Stream.readable
> Js.t

val spawn : string -> string array -> spawned_io
