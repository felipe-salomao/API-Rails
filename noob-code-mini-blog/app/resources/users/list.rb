class Users::List
    attr_accessor :params

    def initialize(params)
        @params = params
    end

    def execute
        User.__search(params)
    end
end