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

external parse : string -> t = "" [@@bs.module "url"]
external toString: t -> string = "" [@@bs.send]
external toJson: t -> string = "" [@@bs.send]
