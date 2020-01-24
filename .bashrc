
# /etc/skel/.bashrc
# Source global definitions
if [ -f /etc/bashrc ]; then
   . /etc/bashrc
fi

export TERM=xterm

# start-up things
umask 0022
if [ `cat ~/hostname`  == "condo" ] 
then
alias vim='/usr/bin/vim' 
alias modbase1='export MODBASE="/shared/software/GIF"; echo "/shared/software/GIF"'
alias modbase2='export MODBASE="/data021/GIF/";echo "/data021/GIF/"'
#module use /data021/GIF/software/modules
module use /work/GIF/genome/modules
module use /work/GIF/user/modules
module use /work/GIF/project/modules
module use /shared/software/GIF/modules/
module purge
#module load LAS/parallel/20150922
#module use /data005/GIF2/resultfiles/
module load severin

export PATH="~/isugif/utilities/utilities/:$PATH"
export GSEQ="/data021/GIF/genomes/sequences"
export GMOD="/data021/GIF/genomes/modules"

elif [ $HOSTNAME = "br005.pvt.bridges.psc.edu" ]
then
module use /pylon2/mc48o5p/severin/software/modules
modue use /pylon2/mc48o5p/severin/genome/modules
module use /pylon2/mc48o5p/severin/user/modules
module use /pylon2/mc48o5p/severin/project/modules
ssh-add ~/.ssh/id_rsa
fi

#module load LAS/parallel/20150922


#if [[ $- !=  *i*  ]]
#then
#   ulimit -s unlimited
#else
#   JAVA_OPTS='-Xms512m -Xmx512m -XX:MaxPermSize=256m'
#fi

#module load LAS/java/1.8.0_60
#results directory
#module use /data005/GIF2/resultfiles/

#eval $(perl -I/home/arnstrm/perl5/lib/perl5 -Mlocal::lib)
#eval $(perl -I/home/severin/perl5/lib/perl5 -Mlocal::lib)
#ulimit -s unlimited
#OMPI_MCA_mpi_warn_on_fork=0

#module improvements
#moduleraw() { eval /usr/bin/modulecmd bash $* ; }
#module() { moduleraw $* 2>&1 ; }
alias moduleavail='cat ~/.modules;module avail > ~/.modules &'
#git configuration
git config --global pack.windowMemory "10m"
git config --global pack.SizeLimit "10m"
git config --global pack.threads "1"

# Alias definitions.
alias jrc='JRC.sh'
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
#alias scp-resume="rsync --partial -h --progress --rsh=ssh"
alias git-commit-count="git log --pretty=format:'' | wc -l"
#alias pep8="pep8 --ignore=E501 -r"
#alias qs="qstat -a -u severin"
#alias qall="qstat -a"
#alias qjobs="qstat -r"
alias dirtree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/ /' -e 's/-/|/'"
#alias qs512="qsub -I -l mem=512Gb,nodes=1:ppn=32:ib32,walltime=48:00:00 -N test"
#alias qI16="qsub -I -N test -l nodes=1:ppn=16 -l walltime=4:00:00"
alias dG='du -hs * | awk '$1~"G"''
alias dT='du -hs * | awk '$1~"T"''


#severin
alias wcp="parallel  --block 1G --pipe wc -l | awk '{s+=$1} END {print s}'"
alias qf="qn | grep free | wc -l"
alias awkt='awk -F "\t"'
alias pwd='pwd -P'
#git
alias gc='git commit -m' 
alias gpom='git push origin master'
alias ga='git add'
alias gpr='find . -type d -name .git -exec sh -c "cd \"{}\"/../ && pwd && git pull" \;'
#############
# Prompt Configuration
#############

# Custom prompts (choose 1)
# PS1 (keep only one active)
PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[01;31m\]\[\033[01;34m\]\$\[\033[00m\] ' # git friendly 
# Making never ending history!
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
export HISTFILE=~/.bash_eternal_history
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

export PATH="~/bin:$PATH"
export PATH="$PATH:/home/severin/.local/bin:~/isugif/utilities/wrappers/:~/isugif/ProjectModules/:~/isugif/common_scripts/:~/isugif/common_analyses/:~/isugif/ascii_plots:~/isugif/oneliners/"
################
# SHORTCUTS
################
export MDIR=/data021/GIF/software/modules
export PDIR=/data021/GIF/software/packages
export EDITOR="nano"
export TMOUT=0
#export LD_PRELOAD=/shared/openmpi/gcc/lib/libmpi.so
#export ZOE=/data004/software/GIF/packages/snap/2013-02-16/Zoe
###############
# PROGRAMS
###############

#ulimit -t 43200

###############
# For Arun
##############
#module load java/1.7.0_76
#module load gatk
TMPDIR="/scratch/severin/${PBS_JOBID}"
#module purge
#module load maker
#module load maker/2.31.8_mpi
#module load java/1.7.0_76
#module load gatk

#module load vcftools/0.1.12b

PATH="/home/severin/perl5/bin${PATH+:}${PATH}"; export PATH;
PERL5LIB="/home/severin/perl5/lib/perl5${PERL5LIB+:}${PERL5LIB}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/severin/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/severin/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/severin/perl5"; export PERL_MM_OPT;

alias si="sinfo -o \"%20P %5D %14F %8z %10m %10d %11l %16f %N\""
alias sq="squeue -o \"%8i %12j %4t %10u %20q %20a %10g %20P %10Q %5D %11l %11L %R\""
#alias canu='/work/GIF/severin/Purcell/WhiteAbalone2018/canu/Linux-amd64/bin/canu'


# Avoid duplicates
export HISTCONTROL=ignoredups:erasedups  
# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend

# After each command, append to the history file and reread it
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

alias ceres="ssh -X andrew.severin@login.scinet.science"
alias gittree="git log --all --decorate --oneline --graph"

# Miniconda
module load miniconda3
#source activate my_root

# Group storage usage

cat /work/GIF/group_storage_usage
