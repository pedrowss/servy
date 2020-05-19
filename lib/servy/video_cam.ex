defmodule Servy.VideoCam do
  @doc """
  Simulates sending a request to an external API
  to get a snapshot image form a video camera.
  """

  def get_snapshot(camera_name) do
    # Code goes here to send a request to the external API

    # Sleep for 1 second to simulate that the API can be slow:
    :timer.sleep(1000)

    # Example response returned from the API:
    "#{camera_name}-snapshot.jpg"
  end
end
