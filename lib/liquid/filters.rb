module Liquid
  module Filters
    # Extracted from locomotivecms/wagon
    # Write the url of a theme stylesheet
    # input: name of the css file
    def stylesheet_url(input)
      return '' if input.nil?

      if input =~ /^https?:/
        input
      else
        input = "/stylesheets/#{input}" unless input =~ /^\//
        input = "#{input}.css" unless input.ends_with?('.css')
        input
      end
    end

    # Extracted from locomotivecms/wagon
    # Write the link to a stylesheet resource
    # input: url of the css file
    def stylesheet_tag(input, media = 'screen')
      return '' if input.nil?

      input = stylesheet_url(input)

      %{<link href="#{input}" media="#{media}" rel="stylesheet" type="text/css" />}
    end

    def script_tag(input)
      return '' if input.nil?

      %{<script src="/#{ThemeKit::PATHS[:javascripts] + "/" + input}" type="text/javascript" ></script>}
    end

    def link_to_news_item(input)
      %{<a href="#">#{input['name']}</a>}
    end

    def link_to_page(input)
      %{<a href="#{input['path']}">#{input['title']}</a>}
    end
  end
end

::Liquid::Template.register_filter(Liquid::Filters)
