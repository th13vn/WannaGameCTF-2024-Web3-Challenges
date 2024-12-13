// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import {ERC2771Context} from "./openzeppelin/ERC2771Context.sol";
import {Multicall} from "./openzeppelin/Multicall.sol";
import "./openzeppelin/ERC20/ERC20.sol";

contract WannaCoin is ERC20, ERC2771Context, Multicall {
    constructor(
        address _trustedForwarder
    ) ERC20("WannaCoin", "WC") ERC2771Context(_trustedForwarder) {
        _mint(_msgSender(), 1_000_000 * 10 ** decimals());
    }

    function _msgSender()
        internal
        view
        override(Context, ERC2771Context)
        returns (address sender)
    {
        return ERC2771Context._msgSender();
    }

    function _msgData()
        internal
        view
        override(Context, ERC2771Context)
        returns (bytes calldata)
    {
        return ERC2771Context._msgData();
    }
}
