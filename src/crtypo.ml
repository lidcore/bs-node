type hash
external createHash : string -> hash = "" [@@bs.module "crypto"]
external update : hash -> string -> unit = "" [@@bs.send]
external digest : hash -> string -> string = "" [@@bs.send]
