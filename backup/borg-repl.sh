#
# borg repl
b=/tmp/bb

mkdir -p /tmp/bb

cd /tmp/bb

borg init --encryption=none /tmp/bb

borg create /tmp/bb::Mon ~/projects/wiki

borg create --stats /tmp/bb::Tues ~/projects/wiki

borg list $b

borg list $b::Mon

e=/tmp/extracted
mkdir -p $e
cd $e

borg extract $b::Mon

export BORG_PASSCOMMAND="cat /home/abergman/.borg_pass"
borg list abergman@wg:/data/borg

borg create --debug --show-rc abergman@wg:/data/borg::g9x-1 projects/wiki

