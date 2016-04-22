#!/usr/bin/env bash

#basics
apt-get update
apt-get install -y zlib1g-dev
apt-get install -y bioperl
apt-get install -y git
apt-get install -y build-essential
apt-get install -y emacs23
apt-get install -y cpanminus
apt-get install mysql-server
apt-get install mysql-client-core-5.5

#This is for Bio::DB::HTS
cpanm -f Module::Build

#These two are for the VEP
cpanm -f File::Copy::Recursive
cpanm -f Archive::Zip

#HTSlib
git clone https://github.com/samtools/htslib.git
cd htslib
make install
cd ..

#get Bio::DB::HTS installed - from GitHub 
git clone https://github.com/Ensembl/Bio-HTS.git
cd Bio-HTS
perl Build.PL
./Build
./Build test
./Build install
cd ..

#Ensembl 
mkdir ensembl-api
cd ensembl-api
git clone --depth 1 https://github.com/Ensembl/ensembl.git
git clone --branch master --depth 1 https://github.com/Ensembl/ensembl-analysis.git
git clone --branch master --depth 1 https://github.com/Ensembl/ensembl-variation.git
git clone --branch master --depth 1 https://github.com/Ensembl/ensembl-funcgen.git
cd ..
