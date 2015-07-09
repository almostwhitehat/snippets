# In rubymine, go to Tools -> Create Command Line Launcher
# Name the launcher "rubymine" without quotation marks
# Save this file in the root of your application as .pryrc

Pry.editor = proc { |file, line| "rubymine #{file} --line #{line} #{file}" }

Pry::Commands.create_command "rm" do
  description "Launches rubymine at the current point"

  def process
    run 'edit --current'
  end
end

Pry.config.hooks.add_hook(:before_session, :rm) do |_, _, _pry_|
  _pry_.run_command("rm")
end
