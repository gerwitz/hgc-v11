require 'rack'
    
module Rack
  
  # A rack middleware for validating HTML via w3c validator
  class Validate
    include Rack::Utils

    def initialize(app)
      @app = app
    end
    
    def call(env)
      status, headers, response = @app.call(env)
      request = Rack::Request.new(env)

      # if request.query_string == 'test'
        if headers["Content-Type"] && headers["Content-Type"].include?("text/html")
          print("Validating #{request.path}...")

          content = extract_content(response)

          issues = Validator.validate(content)

          if issues
            puts("#{issues.count} issues found")

            index = content.rindex("</body>")
            content.insert(index, Validator.generate_report(issues))
            
            headers["Content-Length"] = content.bytesize.to_s
            response = [content]

          else
            puts("no issues")
          end

        end
      # end
      
      [status, headers, response]
    end
  
    def extract_content(response)
      if response.is_a?(Rack::BodyProxy)
        return response.body.first.to_s
      end
    end

    class Validator
      IGNORE_ERRORS = [801]
      # 801: invalid tag

      def self.validate(content)
        doc = Nokogiri::HTML.parse(content)

        if doc.errors.any?
          
          filtered_errors = doc.errors.reject{|e| IGNORE_ERRORS.include?(e.code)}
          return filtered_errors
        else
          return false
        end
      end
      
      def self.generate_report(issues)
        report = ""
        if !issues.empty?
          report << "<table class=\"error\"><caption>#{issues.length} HTML errors found</caption><tbody>"
          issues.each do |e|
            report << "<tr>"
            report << "<td>line #{e.line}</td>"
            report << "<td title=\"code #{e.code}\">#{e.to_s}</td>"
            report << "</tr>\n"
          end
          report << "</tbody></table>\n"
        end
        return report
      end
      
    end

  end
end

