type t = <
  hash:     string;
  host:     string;
  hostname: string;
  href:     string;
  origin:   string;
  password: string;
  pathname: string;
  port:     int;
  protocol: string;
  search:   string;
  username: string
> Js.t

val parse :   string -> t
val toString: t -> string
val toJson:   t -> string
