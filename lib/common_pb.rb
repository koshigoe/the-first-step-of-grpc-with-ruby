# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: common.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "study20180216.Error" do
    optional :code, :string, 1
    optional :summary, :string, 2
    optional :detail, :string, 3
  end
end

module Study20180216
  Error = Google::Protobuf::DescriptorPool.generated_pool.lookup("study20180216.Error").msgclass
end