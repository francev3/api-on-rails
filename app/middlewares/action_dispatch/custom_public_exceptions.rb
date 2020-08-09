module ActionDispatch
	class CustomPublicExceptions < PublicExceptions
		def call(env)
			request = ActionDispatch::Request.new(env)
			status = request.path_info[1..-1].to_i
			content_type = request.formats.first
			# define here your custom format
			body = {ok: false, 
					message: Rack::Utils::HTTP_STATUS_CODES.fetch(status, Rack::Utils::HTTP_STATUS_CODES[500]) } 
			
			render(status, content_type, body)
		end


		private
		def render(status, content_type, body)
			format = "to_json"
	
			render_format(status, content_type, body.public_send(format))
			
		end

		def render_format(status, content_type, body)
			[status, { "Content-Type" => "#{content_type}; charset=#{ActionDispatch::Response.default_charset}",
								"Content-Length" => body.bytesize.to_s }, [body]]
		end
	end
end