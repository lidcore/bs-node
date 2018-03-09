type t
external toString : t -> unit -> string = "" [@@bs.send]
let toString buffer =
  toString buffer ()

type buffer_class
external buffer_class : buffer_class = "Buffer" [@@bs.val]
external alloc : buffer_class -> int -> t = "" [@@bs.send]
let alloc = alloc buffer_class

external concat : buffer_class -> t array -> t = "" [@@bs.send]
let concat = concat buffer_class

external from : buffer_class -> string -> string Js.Nullable.t -> t = "" [@@bs.send]
let from ?encoding data =
  from buffer_class data (Js.Nullable.fromOption encoding)
