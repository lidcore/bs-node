val exec : string -> (string*string) BsCallback.t
val execSync : string -> string

type spawned_io = <
  stdin  : Stream.writable;
  stdout : Stream.readable
> Js.t

val spawn : string -> string array -> spawned_io
