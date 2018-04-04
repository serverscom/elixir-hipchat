defmodule Hipchat.Config do
  @moduledoc """
  Sets up configuration
  """
  @default_url "https://api.hipchat.com"

  @doc """
  Load configuration from a mix config file
  """
  def load(path \\ "~/.hipchat") do
    Mix.Config.read!(path)
  end

  @doc """
  Wrapper that returns token for client
  """
  def configure(token) do
    token
  end
  
  def server_url do
    Application.fetch_env!(:hipchat, :api_url) ||
    System.get_env("HIPCHAT_URL") ||
    @default_url
  end
end
