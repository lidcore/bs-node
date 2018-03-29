type t

external make : unit -> t = "events" [@@bs.module] [@@bs.new]
external on : t -> string -> ('a -> unit [@bs]) -> unit = ""  [@@bs.send]
let on emitter label handler =
  on emitter label (fun [@bs] arg -> handler arg)

external emit : t -> string -> 'a -> unit = "" [@@bs.send]
