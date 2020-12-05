

openssl_create_intermediate_ca_csr () {

  printf "####################################### \n"
  printf "Kreate CSR for issue ca \n"
  printf "/functions/openssl_create_intermediate_ca_csr.sh \n"
  printf "####################################### \n"

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
  printf "Check CSR file...\n"
  printf "#-------------------------------------# \n"

  openssl req                                                                 \
    -in ${DEMO_TMP_DIR}/issue_ca.csr.pem                                      \
    -noout                                                                    \
    -text

}