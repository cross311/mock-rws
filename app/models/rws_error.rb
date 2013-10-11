class RWS_Error
	private_class_method :new
	attr_accessor :message,
								:rws_code,
								:mws_status,
								:http_status

	def self.get_error(rws_short_code)
		case rws_short_code
		when "00071" 
			self.RWS00071
		when "00121"
			self.RWS00121
		else
			self.RWSUnknown
		end
	end

	private

	def self.RWSUnknown
		error = new()
		error.message = "Internal Server Error"
		error.rws_code = "RWS00000"
		error.mws_status = "0000000"
		error.http_status = :internal_server_error
		error
	end

	def self.RWS00071
		error = new()
		error.message = "Query marking group name not found"
		error.rws_code = "RWS00071"
		error.mws_status = "0200002"
		error.http_status = :not_found
		error
	end

	def self.RWS00121
		error = new()
		error.message = "Query already answered"
		error.rws_code = "RWS00121"
		error.mws_status = "0200002"
		error.http_status = :forbidden
		error
	end
end