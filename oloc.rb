require 'json'
SubNet="192.168.10"
Domain="oloc"

fileContent = JSON.parse(File.read("./provision.json"), symbolize_names: true)
puts fileContent
