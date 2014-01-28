module CommandExecutor
  def send_command (command)
  	command.type = command.class.to_s
    $redis.publish 'revents', command.to_json
  end
end