defmodule Httpractice do
    
    def getters do
        
        case HTTPoison.get("http://pitchfork.com/reviews/albums/16859-channel-orange/") do
        {:ok, %HTTPoison.Response{status_code: 200, body: body}} -> 
            Floki.find(body, ".content, p") 
            |> Floki.text
            |> IO.puts
        end
    end
end
