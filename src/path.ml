class type _path = object
  method dirname : string -> string
  method normalize : string -> string
end [@bs]

type path = _path Js.t

external path : path = "" [@@bs.module]

let dirname p = path##dirname p

let normalize p = path##normalize p
