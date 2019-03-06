#!/bin/bash

usage(){
    echo "Usage: progress [options]"
    echo "  --help, -h                                              Print this message"
    echo "  coreutils                                               Show GNU Coreutil Rust rewrite progress"
    echo "  redox                                                   Show Redox progress"
    echo "  remacs                                                  Show Remacs progress"
    echo "  servo                                                   Show Servo progress"
    echo "  xray                                                    Show Xray progress"
    return 1
}

progress() {
    PROG='/home/doc/git/'${1}
    NAME=$(echo ${1} | sed -e "s/\b\(.\)/\u\1/g" )
    echo "Refreshing $NAME"
    sleep 1
    git -C $PROG pull
    clear

    # Sort by files, lines, blanks, code or comments
    SORT='code'

    # Languages to look for
    LANGAUGES="Rust,C,'C Header',C++,'C++ Header',Go,Python,Java,'Objective C++',OCaml,Perl,PHP,Ruby,'FORTRAN Legacy',Pascal,Ada,JavaScript,TypeScript"

    OLD_VERS=$(git -C $PROG.old log -n 1 --pretty=format:%cd | awk '{print $2" "$3", "$5}')
    OLD_COMMITS=$(git -C $PROG.old rev-list HEAD --count | awk '{ len=length($0); res=""; for (i=0;i<=len;i++) { res=substr($0,len-i+1,1) res; if (i > 0 && i < len && i % 3 == 0) { res = "," res } }; print res }')
    OLD_SIZE=$(/bin/du -h $PROG.old | tail -n1 | awk '{print $1}')
    OLD_LOC=$(tokei $PROG.old 2>/dev/null | tail -n2 | head -n1 | awk '{print $3}')
    NEW_VERS=$(git -C $PROG log -n 1 --pretty=format:%cd | awk '{print $2" "$3", "$5}')
    NEW_COMMITS=$(git -C $PROG rev-list HEAD --count | awk '{ len=length($0); res=""; for (i=0;i<=len;i++) { res=substr($0,len-i+1,1) res; if (i > 0 && i < len && i % 3 == 0) { res = "," res } }; print res }')
    NEW_SIZE=$(/bin/du -h $PROG | tail -n1 | awk '{print $1}')
    NEW_LOC=$(tokei $PROG 2>/dev/null  | tail -n2 | head -n1 | awk '{print $3}')

    echo -e $NAME "on" $OLD_VERS "had" $OLD_COMMITS "commits and had a directory size of" $OLD_SIZE "with" $OLD_LOC "lines of code"

    eval "tokei -s ${SORT} -t=${LANGAUGES} ${PROG}.old 2>/dev/null | head -n -2"

    echo
    echo -e $NAME "as of" $NEW_VERS "has" $NEW_COMMITS "commits and has a directory size of" $NEW_SIZE "with" $NEW_LOC "lines of code"

    eval "tokei -s ${SORT} -t=${LANGAUGES} ${PROG} 2>/dev/null | head -n -2"

    if [ "$NAME" == "Xray" ]; then
       xu
   fi
    return 1
}

case $1 in
   coreutils | redox | remacs | servo | xray)
        progress $1 2>/dev/null
    ;;

   *)
        usage
    ;;
esac
