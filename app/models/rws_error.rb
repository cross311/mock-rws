class RWS_Error
	private_class_method :new
	attr_accessor :message,
								:rws_code,
								:mws_status,
								:http_status

	def RWS_Error.create(rws_short_code)
		RWS_Error.RWS00071
	end

	private

	def self.RWS00071
		error = new()
		error.message = "Query marking group name not found"
		error.rws_code = "RWS00071"
		error.mws_status = "0200002"
		error.http_status = :not_found
		error
	end
end