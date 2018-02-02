module Study20180216
  class Storage
    # @return [Redis] Redis クライアント
    attr_reader :redis

    # 初期化。
    def initialize
      @redis = Redis.new(url: ENV['REDIS_URL'])
    end

    # gRPC メッセージオブジェクトを保存する。
    #
    # @param [Object] object gRPC メッセージオブジェクト
    #
    def write(object)
      redis.set(object_key(object.class.descriptor.name, object.id), object.to_proto)
    end

    # gRPC メッセージオブジェクトを取り出す。
    #
    # @param [String] descriptor_name gRPC メッセージのデスクリプタ名
    # @param [String] id gRPC メッセージの ID 属性値
    # @return [Object, nil] gRPC メッセージオブジェクト
    #
    def find(descriptor_name, id)
      res = redis.get(object_key(descriptor_name, id))
      return unless res

      Google::Protobuf::DescriptorPool.generated_pool.lookup(descriptor_name).msgclass.decode(res)
    end

    # gRPC メッセージオブジェクトを削除する。
    #
    # @param [String] descriptor_name gRPC メッセージのデスクリプタ名
    # @param [String] id gRPC メッセージの ID 属性値
    # @return [Boolean] 削除できたら真
    #
    def delete(descriptor_name, id)
      redis.del(object_key(descriptor_name, id)) == 1
    end

    # gRPC メッセージオブジェクトの配列を返す
    #
    # @param [String] descriptor_name gRPC メッセージのデスクリプタ名
    # @return [Array<Object>] gRPC メッセージオブジェクトの配列
    #
    def list(descriptor_name)
      keys = redis.keys(object_key(descriptor_name, '*'))
      return [] if keys.empty?

      descriptor = Google::Protobuf::DescriptorPool.generated_pool.lookup(descriptor_name).msgclass
      redis.mget(keys.sort).map do |data|
        descriptor.decode(data)
      end
    end

    private

    def object_key(descriptor_name, id)
      "#{descriptor_name}:#{id}"
    end
  end
end
