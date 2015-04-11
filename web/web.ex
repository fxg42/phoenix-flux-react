defmodule ExReactWs.Web do
  @moduledoc """
  A module that keeps using definitions for controllers,
  views and so on.

  This can be used in your application as:

      use MyApp.Web, :controller
      use MyApp.Web, :view

  Keep the definitions in this module short and clean,
  mostly focused on imports, uses and aliases.
  """

  def view do
    quote do
      use Phoenix.View, root: "web/templates"

      # Import URL helpers from the router
      import ExReactWs.Router.Helpers

      # Import all HTML functions (forms, tags, etc)
      use Phoenix.HTML

      # Import Phoenix Controller functions
      import Phoenix.Controller, only: [get_flash: 2]

      # *****
      # Copy your old `web/view.ex` using block contents here
      # *****
    end
  end

  def controller do
    quote do
      use Phoenix.Controller

      # Import URL helpers from the router
      import ExReactWs.Router.Helpers
    end
  end

  def model do
    quote do
    end
  end

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
