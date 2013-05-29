#!/usr/bin/ruby
require 'rubygems'

include Nanoc::Helpers::Rendering 

# Thumbnail filter
class Thumbnail < Nanoc::Filter
  identifier :thumbnail
  type       :binary
  def run(filename, params={})
    system(
      'sips',
      '--resampleWidth',
      params[:width].to_s,
      '--out',
      output_filename,
      filename
    )
  end
end