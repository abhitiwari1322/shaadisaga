class UserNews < ActiveRecord::Base
    belongs_to :news
    belongs_to :user

    IS_READ = 1
    IS_DELETED = 1

end
