type 'a callback = 'a -> string -> string -> unit [@bs]

external exec : string -> 'a callback -> unit = "" [@@bs.module "child_process"]

let exec cmd cb =
  exec cmd (fun [@bs] err stdout stderr ->
    cb err (stdout, stderr) [@bs])

external execSync : string -> Buffer.t = "" [@@bs.module "child_process"]

let execSync cmd =
  Buffer.toString (execSync cmd)

type execFileOptions =
  {
    cwd: string[@bs.optional ];
    env: string Js.Dict.t[@bs.optional ];
    encoding: string[@bs.optional ];
    timeout: int[@bs.optional ];
    maxBuffer: float[@bs.optional ];
    killSignal: string[@bs.optional ];
    uid: int[@bs.optional ];
    gid: int[@bs.optional ];
    windowsHide: bool[@bs.optional ];
    windowsVerbatimOptions: bool[@bs.optional ];
    shell: string[@bs.optional ];}[@@bs.deriving abstract]

external execFile :
  string -> string array -> execFileOptions -> 'a callback -> unit = "" [@@bs.module "child_process"]

let execFile ?cwd ?env ?encoding ?timeout ?maxBuffer ?killSignal ?uid ?gid ?windowsHide ?windowsVerbatimOptions ?shell cmd args cb =
  let options = execFileOptions ?cwd ?env ?encoding ?timeout ?maxBuffer ?killSignal ?uid ?gid ?windowsHide ?windowsVerbatimOptions ?shell ()
  in
  execFile cmd args options (fun [@bs] err stdout stderr ->
      cb err (stdout, stderr) [@bs])
