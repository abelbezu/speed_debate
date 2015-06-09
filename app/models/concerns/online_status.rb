#define some methods and keep some data to track the online status of a user.
#

module OnlineStatus
      extend ActiveSupport::Concern

      HASH_KEY = 'online_users'
     
      def online?
        $redis.hget(HASH_KEY, self.id).to_i > 0
      end

      def seen
        $redis.hincrby(HASH_KEY, self.id, 1)
      end

      def left
        user_connections = $redis.hincrby(HASH_KEY, self.id, -1)
        $redis.hdel(HASH_KEY, self.id) if user_connections <= 0
        user_connections
      end

      module ClassMethods
        def online_count
          $redis.hlen HASH_KEY
        end
      end

end
