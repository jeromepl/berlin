# https://stackoverflow.com/questions/27582563/rails-protected-method-around-validation-called-for-statemachinemachine0
# See https://github.com/pluginaweek/state_machine/issues/251
module StateMachine
  module Integrations
     module ActiveModel
        public :around_validation
     end
  end
end
