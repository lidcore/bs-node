type 'a callback = 'a -> string -> string -> unit [@bs]

external exec : string -> 'a callback -> unit = "" [@@bs.module "child_process"]

let exec cmd cb =
  exec cmd (fun [@bs] err stdout stderr ->
    cb err (stdout, stderr) [@bs])

external execSync : string -> Buffer.t = "" [@@bs.module "child_process"]

let execSync cmd =
  Buffer.toString (execSync cmd) 
