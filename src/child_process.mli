type execFileOptions

val exec : string -> (string*string) BsCallback.t
val execSync : string -> string
val execFile: string -> string array -> ?cwd:string -> ?env:string Js.Dict.t -> ?encoding:string -> ?timeout:int -> ?maxBuffer:float -> ?killSignal:string -> ?uid:int -> ?gid:int -> ?windowsHide:bool -> ?windowsVerbatimOptions:bool -> ?shell:string -> (string*string) BsCallback.t
