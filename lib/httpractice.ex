defmodule Httpractice do
    
    def getters do
        
        case HTTPoison.get("http://pitchfork.com/reviews/albums/16859-channel-orange/") do
        {:ok, %HTTPoison.Response{status_code: 200, body: body}} -> 
            Floki.find(body, ".content, p") 
            |> Floki.text
            |> count
        end
    end

    def count(string) do
        String.strip(string)
        |> String.downcase
        |> String.split(" ")
        |> reduce
    end

    defp reduce(word_list) do
        Enum.reduce word_list, %{}, fn (i, acc) -> 
             Dict.update acc, i, 1, &(&1 + 1)
        end
    end

end
