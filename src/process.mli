type event = [
  | `UncaughtException of exn -> unit
  | `SIGINT   of unit -> unit
  | `SIGTERM  of unit -> unit
  | `SIGUSR1  of unit -> unit
  | `SIGPIPE  of unit -> unit
  | `SIGHUP   of unit -> unit
  | `SIGBREAK of unit -> unit
  | `SIGWINCH of unit -> unit
  | `SIGSTOP  of unit -> unit
  | `SIGBUS   of unit -> unit
  | `SIGFPE   of unit -> unit
  | `SIGSEV   of unit -> unit
]

val argv : string array

val exit : int -> 'a

val on : event -> unit

val stdin  : Stream.readable
val stderr : Stream.writable
val stdout : Stream.writable
