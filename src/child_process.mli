open BsAsyncMonad

type t

type 'a stdio_config = [
  | `Pipe
  | `Ignore
  | `Inherit of 'a
]

type exit = [
  | `Code of int
  | `Signal of string
]

type event = [
  | `Error of (exn -> unit)
  | `Exit of (exit -> unit)
]

type stdio = {
  stdin:  Stream.readable stdio_config;
  stdout: Stream.writable stdio_config;
  stderr: Stream.writable stdio_config
}

val exec : string -> (string*string) Callback.t
val execSync : string -> string
val execFile : ?cwd:string -> ?env:string Js.Dict.t -> ?encoding:string -> ?timeout:int ->
               ?maxBuffer:float -> ?killSignal:string -> ?uid:int -> ?gid:int ->
               ?windowsHide:bool -> ?windowsVerbatimOptions:bool -> ?shell:string ->
               string -> string array -> (string*string) Callback.t

val spawn : ?cwd:string -> ?env:string Js.Dict.t -> ?stdio:stdio -> ?shell:bool -> string -> t

val on : t -> event -> unit

val stdin  : t -> Stream.writable
val stdout : t -> Stream.readable
val stderr : t -> Stream.readable
