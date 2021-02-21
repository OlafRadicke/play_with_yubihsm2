

software_reset() {

  printf "####################################### \n"
  printf "Sofware reset of YubiHSM2: \n"
  printf "/functions/software_reset.sh \n"
  printf "####################################### \n"

  yubihsm-shell                                                               \
    --action=reset                                                            \
    --domains=${HSM_SLOT}                                                     \
    --authkey=${AUTH_KEY}                                                     \
    --password="${AUTH_PASSWORD}"

}