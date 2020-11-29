
openssl_root_ca_signed_issue_ca () {

  printf "####################################### \n"
  printf "root ca signed the the csr of issue ca: \n"
  printf "/functions/openssl_root_ca_signed_issue_ca.sh \n"
  printf "####################################### \n"

  printf "#-------------------------------------# \n"
  printf "...With key format variation: ${HSM_SLOT}:000${ROOT_CA_KEY}\n"
  printf "#-------------------------------------# \n"


  openssl ca                                                                  \
    -notext                                                                   \
    -batch                                                                    \
    -rand_serial                                                              \
    -in ${DEMO_TMP_DIR}/issue_ca.csr.pem                                      \
    -days 365                                                                 \
    -config ${DEMO_CONFIG_DIR}/root_ca/openssl.cnf                            \
    -engine pkcs11                                                            \
    -keyform engine                                                           \
    -key "${HSM_SLOT}:000${ROOT_CA_KEY}"                                      \
    -out ${DEMO_TMP_DIR}/issue_ca.crt.pem

  printf "#-------------------------------------# \n"
  printf "...With key format variation: slot_${HSM_SLOT}-id_000${ROOT_CA_KEY}\n"
  printf "#-------------------------------------# \n"


  openssl ca                                                                  \
    -notext                                                                   \
    -batch                                                                    \
    -rand_serial                                                              \
    -in ${DEMO_TMP_DIR}/issue_ca.csr.pem                                      \
    -days 365                                                                 \
    -config ${DEMO_CONFIG_DIR}/root_ca/openssl.cnf                            \
    -engine pkcs11                                                            \
    -keyform engine                                                           \
    -key "slot_${HSM_SLOT}-id_000${ROOT_CA_KEY}"                              \
    -out ${DEMO_TMP_DIR}/issue_ca.crt-v2.pem


}