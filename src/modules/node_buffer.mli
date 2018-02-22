type t
val alloc : int -> t
val concat : t array -> t
val from : ?encoding:string -> string -> t
val toString : t -> string
