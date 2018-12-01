class ApplicationController < ActionController::API
  def tokenForAccount(trainer)
    {
      id: trainer.id,
      token: createToken(trainer)
    }
  end

  def createToken(trainer)
    JWT.encode({'id': trainer.id}, password, 'HS256')
  end

  def password
    ENV['PASSWORD']
  end

  def decodeToken
    token = request.headers["Authorization"]
    begin
      decoded = JWT.decode(token, password, true, {algorithm: 'HS256'})
    rescue JWT::VerificationError
      return nil
    end
    decoded
  end

  def getIdFromToken
    decoded = decodeToken
    unless decoded && decoded[0] && decoded[0]['id']
      return nil
    end
    decoded[0]['id']
  end

  def currentUser
    id = getIdFromToken
    if !!id
      return Trainer.find(id)
    else
      return nil
    end
  end

  def authorized?(trainer)
    getIdFromToken == trainer.id
  end
end
