type t

type 'a stdio_config = [
  | `Pipe
  | `Ignore
  | `Inherit of 'a
]

let stdioConfig = function
  | `Pipe      -> "pipe"
  | `Ignore    -> "ignore"
  | `Inherit s -> Obj.magic s

type stdio = {
  stdin:  Stream.readable stdio_config;
  stdout: Stream.writable stdio_config;
  stderr: Stream.writable stdio_config
}

let stdioConfig {stdin;stdout;stderr} =
  [|stdioConfig stdin; stdioConfig stdout; stdioConfig stderr|]

type 'a callback = 'a -> string -> string -> unit [@bs]

external exec : string -> 'a callback -> unit = "" [@@bs.module "child_process"]

let exec cmd cb =
  exec cmd (fun [@bs] err stdout stderr ->
    cb err (stdout, stderr) [@bs])

external execSync : string -> Buffer.t = "" [@@bs.module "child_process"]

let execSync cmd =
  Buffer.toString (execSync cmd)

type execFileOptions = {
    cwd: string [@bs.optional];
    env: string Js.Dict.t [@bs.optional];
    encoding: string [@bs.optional];
    timeout: int [@bs.optional];
    maxBuffer: float [@bs.optional];
    killSignal: string [@bs.optional];
    uid: int [@bs.optional];
    gid: int [@bs.optional];
    windowsHide: bool [@bs.optional];
    windowsVerbatimOptions: bool [@bs.optional];
    shell: string [@bs.optional]
} [@@bs.deriving abstract]

external execFile :
  string -> string array -> execFileOptions -> 'a callback -> unit = "" [@@bs.module "child_process"]

let execFile ?cwd ?env ?encoding ?timeout ?maxBuffer
             ?killSignal ?uid ?gid ?windowsHide
             ?windowsVerbatimOptions ?shell
             cmd args cb =
  let options =
    execFileOptions ?cwd ?env ?encoding ?timeout ?maxBuffer
                    ?killSignal ?uid ?gid ?windowsHide
                    ?windowsVerbatimOptions ?shell ()
  in
  execFile cmd args options (fun [@bs] err stdout stderr ->
      cb err (stdout, stderr) [@bs])

type spawnOptions = {
  spawnCwd: string [@bs.optional] [@bs.as "cwd"];
  spawnEnv: string Js.Dict.t [@bs.optional] [@bs.as "env"];
  stdio:    string array [@bs.optional];
  shell:     bool [@bs.optional]
} [@@bs.deriving abstract]

external spawn : string -> spawnOptions -> t = "" [@@bs.module "child_process"]

let spawn ?cwd ?env ?stdio ?shell cmd =
  let stdio =
    match stdio with
      | Some stdio ->
          Some (stdioConfig stdio)
      | None -> None
  in
  let options =
    spawnOptions ?spawnCwd:cwd ?spawnEnv:env ?stdio ?shell ()
  in
  spawn cmd options

external stdin : t -> Stream.writable = "" [@@bs.val]
external stdout : t -> Stream.readable = "" [@@bs.val]
external stderr : t -> Stream.readable = "" [@@bs.val]
