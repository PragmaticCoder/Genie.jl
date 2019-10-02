module Exceptions

using Revise
using Genie
using HTTP

export ExceptionalResponse, RuntimeException

struct ExceptionalResponse <: Exception
  response::HTTP.Response
end

function Base.show(io::IO, ex::ExceptionalResponse)
  print(io, "ExceptionalResponseException: $(ex.response.status) - $(Dict(ex.response.headers))")
end

struct RuntimeException <: Exception
  message::String
  info::String
  code::Int
end

RuntimeException(message::String, code::Int) = RuntimeException(message, "", code)

function Base.show(io::IO, ex::RuntimeException)
  print(io, "RuntimeException: $(ex.code) - $(ex.info) - $(ex.message)")
end

end