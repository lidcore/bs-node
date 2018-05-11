type t
val alloc : float -> t
val concat : t array -> t
val length : t -> float
val from : ?encoding:string -> string -> t
val toString : t -> string
val get : t -> float -> int
val set : t -> float -> int -> unit
