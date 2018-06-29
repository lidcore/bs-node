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

external main : t = "" [@@bs.val] [@@bs.scope "require"]
external resolve : string -> string array Js.Nullable.t -> string = "" [@@bs.val] [@@bs.scope "require"]
let resolve ?paths name =
  resolve name (Js.Nullable.fromOption paths)
