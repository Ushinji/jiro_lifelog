# frozen_string_literal: true

module SessionHelper
  def stub_login(user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    allow_any_instance_of(ApplicationController).to receive(:is_login?).and_return(true)
  end
end
