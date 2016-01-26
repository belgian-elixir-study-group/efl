# code by Benjamin Tan Wei Hao

defmodule ID3Parser do

  def parse(file_name) do
    case File.read(file_name) do
      {:ok, mp3} ->
        mp3_byte_size = byte_size(mp3) - 128

        << _ :: binary-size(mp3_byte_size), id3_tag :: binary >> = mp3

        << "TAG", title   :: binary-size(30),
                  artist  :: binary-size(30),
                  album   :: binary-size(30),
                  year    :: binary-size(4),
                  _rest   :: binary >>         = id3_tag

        artist = artist |> String.strip(0)
        title =  title  |> String.strip(0)
        album =  album  |> String.strip(0)

        IO.puts "artist: #{artist}"
        IO.puts "title:  #{title}"
        IO.puts "album:  #{album}"
        IO.puts "year:   #{year}"

      _ -> IO.puts "Couldn't open #{file_name}"
    end
  end

end

ID3Parser.parse("A Forest.mp3")
