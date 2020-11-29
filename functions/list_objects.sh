

list_objects () {


  printf "####################################### \n"
  printf "List opjects in yuniHSM2: \n"
  printf "/functions/list_objects.sh \n"
  printf "####################################### \n"

  yubihsm-shell                                                               \
    --action=list-objects                                                     \
    --domains=0                                                               \
    --object-type=any                                                         \
    --algorithm=any                                                           \
    --authkey="$1"                                                            \
    --password="$2"

}