Code.require_file "html.ex"

defmodule Template do

  import Html

  def render do
    markup do
      div id: "main" do
        h1 class: "title" do
          text "Welcome"
        end
        div class: "row" do
          div do
            p do: text "Hello!"
          end
        end
      end

      table do
        tr do
          for i <- 0..5 do
            td do: text("Cell #{i}")
          end
        end
      end

      div do
        text "Some nested content"
      end

    end
  end

end

IO.puts Template.render

