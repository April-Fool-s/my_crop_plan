class LayoutsController < ApplicationController
  def manifest
    respond_to do |format|
      format.json { render template: 'layouts/manifest.json.erb' }
    end
  end
end