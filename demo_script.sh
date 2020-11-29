#!/bin/bash
clear

# set -e
set -u

source ./functions/change_factory_password.sh
source ./functions/create_ca_key.sh
source ./functions/init_vars_and_dirs.sh
source ./functions/list_objects.sh
source ./functions/openssl_create_intermediate_ca_csr.sh
source ./functions/openssl_root_ca_signed_issue_ca.sh
source ./functions/openssl_self_signed_root_ca.sh
source ./functions/software_rest.sh

init_vars_and_dirs
list_objects ${FACTORY_KEY} ${FACTORY_PASSWORD}
change_factory_password
list_objects ${AUTH_KEY} ${AUTH_PASSWORD}
create_ca_keys ${ROOT_CA_KEY} "root_ca_sign_key"
list_objects ${AUTH_KEY} ${AUTH_PASSWORD}
create_ca_keys ${ISSUE_CA_KEY} "issue_ca_sign_key"
list_objects ${AUTH_KEY} ${AUTH_PASSWORD}
openssl_create_intermediate_ca_csr
openssl_self_signed_root_ca
openssl_root_ca_signed_issue_ca
software_rest
sleep 2
list_objects ${FACTORY_KEY} ${FACTORY_PASSWORD}









