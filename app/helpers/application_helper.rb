# frozen_string_literal: true

module ApplicationHelper
  def active_link_to(name = nil, options = nil, html_options = nil, &block)
    html_options, options, name = options, name, block if block

    html_options ||= {}
    active_class = html_options.delete(:active_class) || "active"
    html_options[:class] = html_options.fetch(:class, "").split.push(active_class).join(" ") if current_page?(options)

    name, options, html_options = options, html_options, nil if block
    link_to(name, options, html_options, &block)
  end
end
