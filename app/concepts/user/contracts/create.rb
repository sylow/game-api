module User::Contract
    class Create < Reform::Form
      include Dry
      property :username
      property :password
  
      validation do
        configure do
            config.messages_file = 'config/locales/schema_errors.yml'
            def unique?(value)
              User.where(username: value).nil?
            end
        end 

        required(:username).filled(:unique?)
        required(:password)
      end
    end
  end