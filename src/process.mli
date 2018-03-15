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

val on : signal -> (unit -> unit) -> unit
