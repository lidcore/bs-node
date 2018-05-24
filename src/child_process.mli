type execFileOptions

val exec : string -> (string*string) BsCallback.t
val execSync : string -> string
val execFile: string -> string array -> execFileOptions -> (string*string) BsCallback.t
