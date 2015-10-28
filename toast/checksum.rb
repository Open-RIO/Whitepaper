require 'digest'
require 'json'
MAGIC = "FAIRY_BREAD"

CFG = JSON.parse(File.read("config.json"))

def create_revision_checksum file
  Digest::SHA1.hexdigest "#{CFG["toast_version"]}_#{CFG["revision"]}_#{MAGIC}_#{file}"
end

def create
  file = File.read("Whitepaper.tex")
  chksum = create_revision_checksum(file)

  File.write("chk/toast.dat", CFG["toast_version"])
  File.write("chk/revision.dat", CFG["revision"])
  File.write("chk/checksum.dat", chksum)
end

create
