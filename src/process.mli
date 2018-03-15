type signal = [
  | `SIGINT
  | `SIGTERM
  | `SIGUSR1
  | `SIGPIPE
  | `SIGHUP
  | `SIGBREAK
  | `SIGWINCH
  | `SIGKILL
  | `SIGSTOP
  | `SIGBUS
  | `SIGFPE
  | `SIGSEV
  | `SIGKILL
]

val on : signal -> (unit -> unit) -> unit
