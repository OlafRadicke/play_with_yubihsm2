
openssl_root_ca_signed_issue_ca () {

  printf "####################################### \n"
  printf "root ca signed the the csr of issue ca: \n"
  printf "/functions/openssl_root_ca_signed_issue_ca.sh \n"
  printf "####################################### \n"

  printf "#-------------------------------------# \n"
  printf "...Without root cert flag\n"
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
  printf "...With flag -ss_cert\n"
  printf "#-------------------------------------# \n"

  openssl ca                                                                  \
    -notext                                                                   \
    -batch                                                                    \
    -rand_serial                                                              \
    -in ${DEMO_TMP_DIR}/issue_ca.csr.pem                                      \
    -ss_cert  ${DEMO_TMP_DIR}/root_ca.crt.pem                                 \
    -days 365                                                                 \
    -config ${DEMO_CONFIG_DIR}/root_ca/openssl.cnf                            \
    -engine pkcs11                                                            \
    -keyform engine                                                           \
    -key "slot_${HSM_SLOT}-id_000${ROOT_CA_KEY}"                              \
    -out ${DEMO_TMP_DIR}/issue_ca-v2.crt.pem

  printf "#-------------------------------------# \n"
  printf "...With flag -cert\n"
  printf "#-------------------------------------# \n"

  openssl ca                                                                  \
    -notext                                                                   \
    -batch                                                                    \
    -rand_serial                                                              \
    -in ${DEMO_TMP_DIR}/issue_ca.csr.pem                                      \
    -cert  ${DEMO_TMP_DIR}/root_ca.crt.pem                                    \
    -days 365                                                                 \
    -config ${DEMO_CONFIG_DIR}/root_ca/openssl.cnf                            \
    -engine pkcs11                                                            \
    -keyform engine                                                           \
    -key "slot_${HSM_SLOT}-id_000${ROOT_CA_KEY}"                              \
    -out ${DEMO_TMP_DIR}/issue_ca-v3.crt.pem

  printf "#-------------------------------------# \n"
  printf "...With x509\n"
  printf "#-------------------------------------# \n"

  openssl x509                                                                \
    -req                                                                      \
    -CAkeyform engine                                                         \
    -engine pkcs11                                                            \
    -in ${DEMO_TMP_DIR}/issue_ca.csr.pem                                      \
    -CA ${DEMO_TMP_DIR}/root_ca.crt.pem                                       \
    -CAkey "slot_${HSM_SLOT}-id_000${ROOT_CA_KEY}"                            \
    -set_serial $RANDOM                                                       \
    -sha256                                                                   \
    -out ${DEMO_TMP_DIR}/issue_ca-v4.crt.pem

}