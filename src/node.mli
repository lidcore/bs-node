module Child_process : sig
  include module type of Child_process
end

module Fs : sig
  include module type of Fs
end

module Buffer : sig
  include module type of Node_buffer
end

module Os : sig
  include module type of Os
end

module Stream : sig
  include module type of Stream
end
