type signal = [
  | `SIGINT
  | `SIGTERM
  | `SIGUSR1
  | `SIGPIPE
  | `SIGHUP
  | `SIGBREAK
  | `SIGWINCH
  | `SIGSTOP
  | `SIGBUS
  | `SIGFPE
  | `SIGSEV
] [@@bs.deriving jsConverter]

type process

external process : process = "" [@@bs.val]
external on : process -> string -> (unit -> unit) -> unit = "" [@@bs.send]

let on signal fn =
  on process (signalToJs signal) fn
