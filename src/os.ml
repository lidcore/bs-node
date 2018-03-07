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

external cpus : unit -> cpu array = "" [@@bs.module "os"]
external platform : unit -> string = "" [@@bs.module "os"]
external hostname : unit -> string = "" [@@bs.module "os"]
