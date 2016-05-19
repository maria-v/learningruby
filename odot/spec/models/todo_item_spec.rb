require 'spec_helper'

describe TodoItem do
  it { should belong to(:todo_list) }
end
