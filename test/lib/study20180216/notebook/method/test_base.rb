require 'minitest_helper'

describe Study20180216::Notebook::Method::Base do
  describe '#call' do
    it 'raise NotImplementedError' do
      begin
        Study20180216::Notebook::Method::Base.new(nil, nil).call
      rescue NotImplementedError
        assert { true }
      else
        assert { false }
      end
    end
  end
end
