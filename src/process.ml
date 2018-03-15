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
]

let string_of_signal = function
  | `SIGINT -> "SIGINT"
  | `SIGTERM -> "SIGTERM"
  | `SIGUSR1 -> "SIGUSR1"
  | `SIGPIPE -> "SIGPIPE"
  | `SIGHUP -> "SIGHUP"
  | `SIGBREAK -> "SIGBREAK"
  | `SIGWINCH -> "SIGWINCH"
  | `SIGSTOP -> "SIGSTOP"
  | `SIGBUS -> "SIGBUS"
  | `SIGFPE -> "SIGFPE"
  | `SIGSEV -> "SIGSEV"

type process

external process : process = "" [@@bs.val]
external on : process -> string -> (unit -> unit) -> unit = "" [@@bs.send]

let on signal fn =
  on process (string_of_signal signal) fn
