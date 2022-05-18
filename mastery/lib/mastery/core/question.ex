defmodule Master.Core.Question do
  defstruct ~w[asked subtitutions templates]a

  def new(%Template{} = template) do
    template.generators
    |> Enum.map(&build_subtitution/1)
    |> evaulate(template)
  end

  defp build_subtitution({name, choices_or_generator}) do
    {name, choose(choices_or_generator)}
  end

  defp choose(choices) when is_list(choices) do
    Enum.random(choices)
  end

  defp choose(generator) when is_function(generator) do
    generator.()
  end

  defp compile(template, subtitutions) do
    template.compiled
    |> Code.eval_quoted(assigns: subtitutions)
    |> elem(0)
  end

  defp evaulate(subtitutions, template) do
    %__MODULE__{
      asked: compile(template, subtitutions),
      subtitutions: subtitutions,
      template: template
    }
  end
end
