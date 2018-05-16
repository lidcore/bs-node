type 'a callback = 'a -> string -> string -> unit [@bs]

external exec : string -> 'a callback -> unit = "" [@@bs.module "child_process"]

let exec cmd cb =
  exec cmd (fun [@bs] err stdout stderr ->
    cb err (stdout, stderr) [@bs])

external execSync : string -> Buffer.t = "" [@@bs.module "child_process"]

let execSync cmd =
  Buffer.toString (execSync cmd) 

type spawned_io = <
  stdin  : Stream.writable;
  stdout : Stream.readable
> Js.t

type spawn_params = <
  stdio: string array
> Js.t

external spawn : string -> string array -> spawn_params -> spawned_io = "" [@@bs.module "child_process"]

let spawn cmd args =
  let stdio =
    [|"pipe";"pipe";"inherit"|]
  in
  let params = [%bs.obj{
    stdio = stdio
  }] in
  spawn cmd args params
