
openssl_root_ca_signed_issue_ca () {

  printf "####################################### \n"
  printf "root ca signed the the csr of issue ca: \n"
  printf "/functions/openssl_root_ca_signed_issue_ca.sh \n"
  printf "####################################### \n"


  OPENSSL_CONF=${DEMO_CONFIG_DIR}/root_ca/openssl.cnf                         \
  openssl x509                                                                \
    -req                                                                      \
    -engine pkcs11                                                            \
    -in ${DEMO_TMP_DIR}/issue_ca.csr.pem                                      \
    -CA ${DEMO_TMP_DIR}/root_ca.crt.pem                                       \
    -CAcreateserial                                                           \
    -CAkeyform engine                                                         \
    -CAkey "${HSM_SLOT}:000${ROOT_CA_KEY}"                                    \
    -sha256                                                                   \
    -out ${DEMO_TMP_DIR}/issue_ca.crt.pem

  printf "#-------------------------------------# \n"
  printf "Check certifikat...\n"
  printf "#-------------------------------------# \n"

  openssl x509                                                                \
    -in ${DEMO_TMP_DIR}/issue_ca.crt.pem                                      \
    -noout                                                                    \
    -text

}