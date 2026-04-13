pinfo() {
  pecho ✅ $@
}

pwarn() {
  pecho 🔥 $@
}

pnotice() {
  pecho 💡 $@
}

pecho() {
  local icon="$1"; shift
  local date=`date`

  echo -e "${date}\t$icon  $@"
}

prompt() {
  pecho 🚧 "Press any key to continue"
  read -n 1 -s
}
