# render script - markdown
#
# In order to preview your markdown files, you can use the madness markdown
# server <https://madness.dannyb.co/>:
#
#   $ gem install madness
#   $ madness server docs
#

# Load the GTX template
template = "#{source}/markdown.gtx"
gtx = GTX.load_file template

# Render the file for the main command
save "#{target}/index.md", gtx.parse(command)

# Render a file for each subcommand
command.deep_commands.reject(&:private).each do |subcommand|
  save "#{target}/#{subcommand.full_name}.md", gtx.parse(subcommand)
end
