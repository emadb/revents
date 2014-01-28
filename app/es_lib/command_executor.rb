module CommandExecutor
  def send_command (command)
    $redis.publish 'revent', command.to_json
  end
end