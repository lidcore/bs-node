type t
val make : unit -> t
val on : t -> string -> ('a -> unit) -> unit
val emit : t -> string -> 'a -> unit
