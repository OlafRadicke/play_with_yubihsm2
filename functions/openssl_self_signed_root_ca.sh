
openssl_self_signed_root_ca () {

  printf "####################################### \n"
  printf "Create self signed root_ca: \n"
  printf "/functions/openssl_self_signed_root_ca.sh \n"
  printf "####################################### \n"


  printf "#-------------------------------------# \n"
  printf "...With key format variation: ${HSM_SLOT}:000${ROOT_CA_KEY}\n"
  printf "#-------------------------------------# \n"

  openssl req                                                                 \
    -new                                                                      \
    -x509                                                                     \
    -days 9125                                                                \
    -nodes                                                                    \
    -config ${DEMO_CONFIG_DIR}/root_ca/openssl.cnf                            \
    -extensions v3_ca                                                         \
    -engine pkcs11                                                            \
    -key "${HSM_SLOT}:000${ROOT_CA_KEY}"                                      \
    -keyform engine                                                           \
    -out ${DEMO_TMP_DIR}/root_ca.crt.pem

  printf "#-------------------------------------# \n"
  printf "...With key format variation: slot_${HSM_SLOT}-id_000${ROOT_CA_KEY}\n"
  printf "#-------------------------------------# \n"

  openssl req                                                                 \
    -new                                                                      \
    -x509                                                                     \
    -days 9125                                                                \
    -nodes                                                                    \
    -config ${DEMO_CONFIG_DIR}/root_ca/openssl.cnf                            \
    -extensions v3_ca                                                         \
    -engine pkcs11                                                            \
    -key "slot_${HSM_SLOT}-id_000${ROOT_CA_KEY}"                              \
    -keyform engine                                                           \
    -out ${DEMO_TMP_DIR}/root_ca-v2.crt.pem

}