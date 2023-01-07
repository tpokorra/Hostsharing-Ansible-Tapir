#!/bin/sh

# from https://wiki.hostsharing.net/index.php?title=OpenLDAP

BASE_DIR="${HOME}/slapd2"
BASE_DN="{{ldap_base_dn}}"

INITIAL_PASSWORD="{{ldap_admin_password}}"

BIND_IP_ADDR="127.0.0.1"
BIND_IP_PORT="{{ldap_port}}"


############################################################################


# Fail, if base directory already exists

if test -e ${BASE_DIR}; then
    echo "Initialization failed." >&2
    echo "Base directory already exists." >&2
    exit 1
fi


# Create directory

mkdir -p -m 700 ${BASE_DIR}
cd ${BASE_DIR}


# Unpack initital configuration

cat <<EOF |base64 -d |tar -xz
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
EOF


# Patch configuration files

sed -e"s%BASE_DIR%${BASE_DIR}%" -i $(find -name \*.ldif)
sed -e"s%BASE_DN%${BASE_DN}%" -i $(find -name \*.ldif)
sed -e"s%INITIAL_PASSWORD%${INITIAL_PASSWORD}%" -i $(find -name \*.ldif)


# Fix CRC32 checksums on configuration files

for FILE in $(find -name \*.ldif); do
    CRC32=$(tail -n +3 ${FILE} |crc32 /dev/stdin)
    sed -e"s/^# CRC32 [0-9a-f]*$/# CRC32 ${CRC32}/" -i ${FILE}
done


# Add Root DSE

DC=$(echo ${BASE_DN} |cut -d "," -f1 |cut -d "=" -f2)

cat <<EOF |/usr/sbin/slapadd -F "${BASE_DIR}/etc" -b ${BASE_DN}
dn: ${BASE_DN}
dc: ${DC}
objectClass: domain
objectClass: top
structuralObjectClass: domain
EOF


# Print instructions

cat <<EOF

Instructions
============

Launch slapd (debug level 0 - foreground mode)
$ /usr/sbin/slapd -h "ldap://${BIND_IP_ADDR}:${BIND_IP_PORT}/" -F "${BASE_DIR}/etc" -d 0

LDAPvi on cn=config
$ ldapvi -h "ldap://${BIND_IP_ADDR}:${BIND_IP_PORT}/" -D "cn=admin,cn=config" -b "cn=config"

LDAPvi on dc=hostsharing,dc=net
$ ldapvi -h "ldap://${BIND_IP_ADDR}:${BIND_IP_PORT}/" -D "cn=admin,${BASE_DN}" -b "${BASE_DN}"

Do not forget to update the intitial passwords for both identities:

    cn=admin,cn=config
    cn=admin,${BASE_DN}

EOF