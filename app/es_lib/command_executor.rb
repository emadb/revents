module CommandExecutor
  def send_command (command)
    $redis.publish 'revents', command.to_json
  end
end