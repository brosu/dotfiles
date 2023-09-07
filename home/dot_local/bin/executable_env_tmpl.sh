template_file="$1"
env_file="$2"

cmd='
FNR==NR {
  a[$1]="";
  next
}
( $1 in a ) {
  print $0
}'
awk -F"=" "$cmd" "${template_file}" "${env_file}"
