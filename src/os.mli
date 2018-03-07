type cpu = <
  model: string;
  speed: int;
  times: <
    user: int;
    nice: int;
    sys:  int;
    idle: int;
    irq:  int
  > Js.t
> Js.t

val cpus     : unit -> cpu array
val hostname : unit -> string
val platform : unit -> string
