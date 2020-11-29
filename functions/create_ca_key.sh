

create_ca_keys () {

  printf "####################################### \n"
  printf "/functions/change_factory_password.sh \n"
  printf "/functions/create_ca_key.sh \n"
  printf "####################################### \n"

  yubihsm-shell                                                               \
    --action=generate-asymmetric-key                                          \
    --object-id=${1}                                                          \
    --label="${2}"                                                            \
    --algorithm="rsa2048"                                                     \
    --capabilities=sign-pkcs,sign-pss,sign-ecdsa,sign-eddsa,sign-ssh-certificate \
    --authkey="${AUTH_KEY}"                                                   \
    --password="${AUTH_PASSWORD}"

}