module Response
  def json_response(object, message="", status = :ok)
  	data = {id: object.id, firstName: object.firstName, lastName: object.lastName, email: object.email}
 		render json: data, message: message, status: status
  end


   def json_success_response(object, message="", status = :ok)
 			data = []
			object.each do |user|
				obj = {id: user.id, firstName: user.firstName, lastName: user.lastName, email: user.email}
				data << obj
			end
			render json: data, message: message, status: status
  end
end