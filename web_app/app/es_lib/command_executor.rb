module CommandExecutor
  def send_command (command)
  	channel = command.class.name.sub(/Command/, '')
  	$redis.publish channel, command.to_json
  end
end