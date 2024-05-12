#!bin/bash
wg-quick up cli-b || wg-quick up cli-a
sleep 1000