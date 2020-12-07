
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

#####################################################################################

  printf "#-------------------------------------# \n"
  printf "Alternativ with openssl ca...\n"
  printf "#-------------------------------------# \n"

  touch ${DEMO_TMP_DIR}/index

  openssl ca                                                                  \
    -config ${DEMO_CONFIG_DIR}/root_ca/openssl.cnf                            \
    -days 99                                                                  \
    -notext                                                                   \
    -batch                                                                    \
    -rand_serial                                                              \
    -in ${DEMO_TMP_DIR}/issue_ca.csr.pem                                      \
    -cert ${DEMO_TMP_DIR}/root_ca.crt.pem                                     \
    -engine pkcs11                                                            \
    -keyform engine                                                           \
    -key "${HSM_SLOT}:000${ROOT_CA_KEY}"                                      \
    -out ${DEMO_TMP_DIR}/issue_ca-v2.crt.pem

  printf "#-------------------------------------# \n"
  printf "Check certifikat v2...\n"
  printf "#-------------------------------------# \n"


  openssl x509                                                                \
    -in ${DEMO_TMP_DIR}/issue_ca-v2.crt.pem                                      \
    -noout                                                                    \
    -text

# openssl ca -config ./openssl.cnf -extensions v3_intermediate_ca -days 1825 -notext -md sha256 -key 0:0001 -keyform engine -engine pkcs11 -in intermediate/csr/first.intermediate.csr.pem -out test.pem

# -key 0:001 -engine pkcs11 -keyform engine

}