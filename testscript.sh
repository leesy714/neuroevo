#!/bin/bash
if [ $# -eq 0 ] 
then 
    seed=1
    device_num=0
else
    seed=$1
    device_num=$2
fi
frames=10000000
pop=100
#for i in {Frostbite,Sequest,Pong,SpaceInvaders,BeamRider}; do
#for i in {Breakout,Enduro,MontezumaRevenge}; do
#for i in {Seaquest,Pong,SpaceInvaders,BeamRider,Breakout,Enduro,Gravitar,Kangaroo,Venture,Zaxxon,Skiing,Amidar}; do
#for i in {Frostbite,BeamRider}; do
for i in {Frostbite,Seaquest,SpaceInvaders,BeamRider,Breakout,Enduro,Gravitar,Kangaroo,Venture,Zaxxon,Skiing,Amidar}; do
    echo CUDA_VISIBLE_DEVICES=${device_num} python run_ga_local.py --env-name "${i}NoFrameskip-v4" --total-frames ${frames} --population ${pop} --seed ${seed} --save-dir ./trained_models/frames${frames}_seed${seed}/ga/;
    CUDA_VISIBLE_DEVICES=${device_num} python -W ignore run_ga_local.py --env-name "${i}NoFrameskip-v4" --total-frames ${frames} --population ${pop} --seed ${seed}  --save-dir ./trained_models/frames${frames}_seed${seed}/ga/;
done
