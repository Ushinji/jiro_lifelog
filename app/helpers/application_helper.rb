# frozen_string_literal: true

module ApplicationHelper
  def assets_path(path)
    webpack_dev_server_path(path)
  end

  private

  def webpack_dev_server_path(path)
    "http://localhost:4000/#{path}"
  end
end
