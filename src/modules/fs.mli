val copyFileSync : string -> string -> unit
val createWriteStream : ?path:string -> ?fd:int -> ?autoClose:bool -> unit -> Stream.writable
val createReadStream : ?path:string -> ?fd:int -> ?autoClose:bool -> unit -> Stream.readable
val existsSync : string -> bool
val openFile : string -> string -> int Callback.t
val close : int -> unit Callback.t
val unlinkSync : string -> unit 
val read : int -> Node_buffer.t -> int -> int -> int -> (int*Node_buffer.t) Callback.t
val readFile : string -> string Callback.t
val readFileSync : string -> string
val writeFile : string -> string -> unit Callback.t
