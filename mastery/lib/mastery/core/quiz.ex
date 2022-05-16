defmodule Mastery.Core.Quiz do
  defstruct titele: nil,
  mastery: 3,
  templates: %{},
  used: [],
  current_question: nil,
  last_response: nil,
  record: %{},
  mastered: []
end
