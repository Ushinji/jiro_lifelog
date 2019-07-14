# frozen_string_literal: true

module ApplicationHelper
  def assets_path(path)
    return webpack_dev_server_path(path) if Rails.env.development? || Rails.env.test?
    manifest = Rails.application.config.assets_manifest
    path = manifest[path] if manifest && manifest[path].present?
    "/dist/#{path}"
  end

  private

  def webpack_dev_server_path(path)
    "http://localhost:4000/#{path}"
  end
end
