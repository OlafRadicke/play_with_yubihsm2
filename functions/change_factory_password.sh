

change_factory_password () {

  printf "####################################### \n"
  printf "Change factory password of YubiHSM2: \n"
  printf "/functions/change_factory_password.sh \n"
  printf "####################################### \n"

  printf "#-------------------------------------# \n"
  printf "...Create new authentication-key: ${AUTH_KEY}\n"
  printf "#-------------------------------------# \n"

  yubihsm-shell                                                               \
    --action=put-authentication-key                                           \
    --object-id=${AUTH_KEY}                                                   \
    --label="Audit auth key"                                                  \
    --capabilities="all"                                                      \
    --object-type="all"                                                       \
    --delegated="all"                                                         \
    --new-password="${AUTH_PASSWORD}"                                         \
    --authkey="${FACTORY_KEY}"                                                \
    --password="${FACTORY_PASSWORD}"

  printf "#-------------------------------------# \n"
  printf "...Delet the factory key: ${FACTORY_KEY}\n"
  printf "#-------------------------------------# \n"

  yubihsm-shell                                                               \
    --action=delete-object                                                    \
    --object-id="${FACTORY_KEY}"                                              \
    --object-type="authentication-key"                                        \
    --authkey="${AUTH_KEY}"                                                   \
    --password="${AUTH_PASSWORD}"

}