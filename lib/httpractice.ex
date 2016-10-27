defmodule Httpractice do
    
    def getters do
        
        case HTTPoison.get("http://hipsterjesus.com/api/") do
        {:ok, %HTTPoison.Response{status_code: 200, body: body}} -> IO.puts body end
    end
end
