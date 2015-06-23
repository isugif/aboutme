
# /etc/skel/.bashrc
# Source global definitions
if [ -f /etc/bashrc ]; then
   . /etc/bashrc
 fi


# start-up things
umask 0022
if [ `grep -v "#" /var/spool/torque/server_name  | grep .` = "hpc5" ]
then
module use  /data004/software/GIF/modules
elif [ `grep -v "#" /var/spool/torque/server_name  | grep .` = "condo" ]
then
module use /data003/GIF/software/modules
fi

module load parallel
#eval $(perl -I/home/arnstrm/perl5/lib/perl5 -Mlocal::lib)
#eval $(perl -I/home/severin/perl5/lib/perl5 -Mlocal::lib)
#ulimit -s unlimited
#OMPI_MCA_mpi_warn_on_fork=0

#git configuration
git config --global pack.windowMemory "10m"
git config --global pack.SizeLimit "10m"
git config --global pack.threads "1"

# Alias definitions.
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ls='ls --color=auto -v'
alias du='du -kh'	# Makes a more readable output.
alias df='df -kTh'
alias dd='du -sch *'
alias lh='ls -lh'                  # sort in readable way
alias la='ls -AlL'          # show hidden files and show size of files that are softlinked
alias lx='ls -lXB'         # sort by extension
alias lk='ls -lSr'         # sort by size, biggest last
alias lc='ls -ltcr'        # sort by and show change time, most recent last
alias lu='ls -ltur'        # sort by and show access time, most recent last
alias lt='ls -ltr'         # sort by date, most recent last
alias lm='ls -al |more'    # pipe through 'more'
alias lr='ls -lR'          # recursive ls
alias ld='ls -d */'                     # list directories only
alias ll='ls -l'
alias lsr='tree -Csu'     # nice alternative to 'recursive ls'
alias scp-resume="rsync --partial -h --progress --rsh=ssh"
alias git-commit-count="git log --pretty=format:'' | wc -l"
alias pep8="pep8 --ignore=E501 -r"
alias qs="qstat -a -u severin"
alias qall="qstat -a"
alias qjobs="qstat -r"
alias dirtree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/ /' -e 's/-/|/'"
alias qs512="qsub -I -l mem=512Gb,nodes=1:ppn=32:ib32,walltime=48:00:00 -N test"
alias qI16="qsub -I -N test -l nodes=1:ppn=16 -l walltime=4:00:00"
alias dG='du -hs * | awk '$1~"G"''
alias dT='du -hs * | awk '$1~"T"''


#severin
alias wcp="wc -l - | awk '{s+="'$1'"} END {print s}'"
alias qf="qn | grep free | wc -l"
alias awkt='awk -F "\t"'

#git
alias gc='git commit -m' 
alias gpom='git push origin master'
alias ga='git add'

#############
# Prompt Configuration
#############

# Custom prompts (choose 1)
# PS1 (keep only one active)
# PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[01;31m\]`git branch 2>/dev/null | grep ^* | tr -d \*` \[\033[01;34m\]\$\[\033[00m\] '
PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[01;31m\]\[\033[01;34m\]\$\[\033[00m\] ' # git friendly 
# Making never ending history!
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
export HISTFILE=~/.bash_eternal_history
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

export PATH="~/bin:$PATH"
export PATH="$PATH:~/isugif/ascii_plots:~/isugif/oneliners/"
################
# SHORTCUTS
################
export MDIR=/data003/GIF/software/modules
export PDIR=/data003/GIF/software/packages
export EDITOR="nano"
export TMOUT=0
#export LD_PRELOAD=/shared/openmpi/gcc/lib/libmpi.so
#export ZOE=/data004/software/GIF/packages/snap/2013-02-16/Zoe
###############
# PROGRAMS
###############

#ulimit -t 43200
