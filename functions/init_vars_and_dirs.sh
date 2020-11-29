
init_vars_and_dirs () {

  printf "####################################### \n"
  printf "Init varables and directories: \n"
  printf "/functions/init_vars_and_dirs.sh \n"
  printf "####################################### \n"

  # export YUBIHSM_PKCS11_CONF=./yubihsm_pkcs11.conf
  export YUBIHSM_PKCS11_DBG=true
  export HSM_SLOT=0
  export FACTORY_KEY=1
  export FACTORY_PASSWORD=password
  export AUTH_KEY=2
  export AUTH_PASSWORD=password2
  export ROOT_CA_KEY=4
  export ISSUE_CA_KEY=5
  export DEMO_TMP_DIR=./tmp
  export DEMO_CONFIG_DIR=./configs

  mkdir -p ${DEMO_TMP_DIR}

}