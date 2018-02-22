type 'a callback = 'a -> string -> string -> unit [@bs]

external exec : string -> 'a callback -> unit = "" [@@bs.module "child_process"]

let exec cmd cb =
  exec cmd (fun [@bs] err stdout stderr ->
    cb err (stdout, stderr) [@bs])

external execSync : string -> Node_buffer.t = "" [@@bs.module "child_process"]

let execSync cmd =
  Node_buffer.toString (execSync cmd) 
