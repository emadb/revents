module CommandExecutor
  def send_command (command)
  	command.type = command.class.to_s
  	# TODO: don't use revents as topic but object class
    $redis.publish 'revents', command.to_json
  end
end