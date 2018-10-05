module MockParticle
  class Standard
    include Laminar::Transacticle

    def call(x:, y:)
      context[:message] = 'called'
    end
  end

  class Fails
    include Laminar::Transacticle

    def call(model:)
      model.update!(name: 'bogus')
      context.fail!(message: 'fail')
    end
  end

  class Halts
    include Laminar::Transacticle

    def call(model:)
      model.update!(name: 'bogus')
      context.halt!(message: 'halt')
    end
  end

  class Errors
    include Laminar::Transacticle

    def call(model:)
      model.update!(name: 'bogus')
      raise StandardError
    end
  end
end
