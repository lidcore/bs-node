type exports

type t = {
  id: string;
  exports: exports;
  parent: t Js.Nullable.t;
  filenane: string;
  loaded: bool;
  children: t array;
  paths: string array
} [@@bs.deriving abstract]

val main : t
val resolve : ?paths:string array -> string -> string

