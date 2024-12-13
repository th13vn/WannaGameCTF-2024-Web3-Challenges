// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import {WannaCoin} from "./WannaCoin.sol";
import {Forwarder} from "./Forwarder.sol";

contract Setup {
    WannaCoin public immutable coin;
    Forwarder public immutable forwarder;

    constructor() {
        forwarder = new Forwarder();
        coin = new WannaCoin(address(forwarder));
    }

    function isSolved() external view returns (bool) {
        return coin.balanceOf(address(coin)) > 10_000 * 10 ** coin.decimals();
    }
}
