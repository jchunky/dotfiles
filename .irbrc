IRB.conf[:SAVE_HISTORY] = 200
IRB.conf[:HISTORY_FILE] = '~/.irb-history'

def ras
  require "active_support/all"
  Time.zone = "Eastern Time (US & Canada)"
end

def uuid
  require "securerandom"
  SecureRandom.uuid
end

def set_account(id)
  Account.find(id).set_schema_search_path
end

def load(condition = :always, &block)
  case condition
  when :always
    block.call
  when :rails
    block.call if ENV['RAILS_ENV']
  when :irb
    block.call unless ENV['RAILS_ENV']
  end
rescue Exception => ex
  puts ex
end

load(:irb) do
  require 'whats_up/classic'

  # Fix whats_up for rails console
  blacklist = WhatsUp::MethodFinder.class_variable_get("@@blacklist")
  blacklist += Object.instance_methods
  WhatsUp::MethodFinder.class_variable_set("@@blacklist", blacklist)
end

load(:rails) do
  # Including FactoryBot breaks the following command:
  # WorkOrder.first.update(description: "lkj")
  #include FactoryBot::Syntax::Methods
rescue Exception => ex
  puts ex
end

load(:rails) do
  Time.zone = "Eastern Time (US & Canada)"
end

load do
  require 'interactive_editor'
end

load do
  # Predefine hash and array instances for convenience
  H = { bob: 'Bob', mom: 'Mom', gods: 'Gos', chris: 'Chris' }
  A = H.keys
end
