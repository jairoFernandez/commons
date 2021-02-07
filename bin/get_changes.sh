#!/bin/bash

mirror_changes() {
    mirror=$1
    remote_branch=$2
    local_branch=$3

    echo ""
    echo -e "${GREEN}-------------------------------"
    echo -e "  🔔 Getting data from mirror"
    echo -e "-------------------------------${NOCOLOR}"
    echo ""
    echo -e "${GREEN}-------------------------------"
    echo -e "  ${YELLOW}Mirror        : ${GREEN}${mirror}"
    echo -e "  ${YELLOW}Remote branch : ${GREEN}${remote_branch}"
    echo -e "  ${YELLOW}Local branch  : ${GREEN}${local_branch}"
    echo -e "-------------------------------${NOCOLOR}"
    echo ""

    if [[ "$remote_branch" == "" ]]; then
        echo ""
        echo -e "🔕 ${RED} Please set a branch from mirror${NOCOLOR}"
        exit 1
    fi

    if [[ "$local_branch" == "" ]]; then
        echo ""
        echo -e "🔕 ${RED} Please set a local new branch${NOCOLOR}"
        exit 1
    fi


    actual_dir="$(pwd)"
    git checkout -b ${local_branch}

    rm -rf /tmp/mirror-repo
    mkdir /tmp/mirror-repo && cd /tmp/mirror-repo
    git clone --branch ${remote_branch} ${mirror} temporal
    cd temporal
    rm -rf .git
    ls
    cp -R . ${actual_dir}
    rm -rf /tmp/mirror-repo
}

