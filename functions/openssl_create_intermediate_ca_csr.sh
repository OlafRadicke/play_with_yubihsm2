

openssl_create_intermediate_ca_csr () {

  printf "####################################### \n"
  printf "Kreate CSR for issue ca \n"
  printf "/functions/openssl_create_intermediate_ca_csr.sh \n"
  printf "####################################### \n"

  printf "#-------------------------------------# \n"
  printf "...With key format variation: ${HSM_SLOT}:000${ROOT_CA_KEY}\n"
  printf "#-------------------------------------# \n"


  openssl req                                                                 \
    -new                                                                      \
    -sha256                                                                   \
    -nodes                                                                    \
    -config ${DEMO_CONFIG_DIR}/issue_ca/openssl.cnf                           \
    -engine pkcs11                                                            \
    -key ${HSM_SLOT}:000${ISSUE_CA_KEY}                                       \
    -keyform engine                                                           \
    -out ${DEMO_TMP_DIR}/issue_ca.csr.pem

  printf "#-------------------------------------# \n"
  printf "...With key format variation: slot_${HSM_SLOT}-id_000${ROOT_CA_KEY}\n"
  printf "#-------------------------------------# \n"


  openssl req                                                                 \
    -new                                                                      \
    -sha256                                                                   \
    -nodes                                                                    \
    -config ${DEMO_CONFIG_DIR}/issue_ca/openssl.cnf                           \
    -engine pkcs11                                                            \
    -key slot_${HSM_SLOT}-id_000${ISSUE_CA_KEY}                               \
    -keyform engine                                                           \
    -out ${DEMO_TMP_DIR}/issue_ca-v2.csr.pem


}